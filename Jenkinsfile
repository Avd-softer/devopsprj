Pipline pipeline { agent any

stages { stage('Checkout') { steps {
checkout scm
}
}

stage('Build Docker Image') { steps {
script {
docker.build("devopsprj:${env.BUILD_NUMBER}")
}
}
}

stage('Run Docker Container') { steps {
script {
bat 'docker stop devopsprj || exit 0' bat 'docker rm devopsprj || exit 0'
bat "docker run -d -p 8081:80 --name devopsprj devopsprj:%BUILD_NUMBER%" echo " App deployed at: http://localhost:8081"
}
}
}
}

post { success {
echo ' Build & deployment done!'
}
failure {
echo ' Build failed.'
}
}
}
