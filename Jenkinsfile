 pipeline { agent any

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
}pipeline {
    agent any

    environment {
        IMAGE_NAME = "devopsprj"
        IMAGE_TAG = "4"
        CONTAINER_NAME = "devopsprj"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${devopsprj}:${v2} ."
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    // Stop and remove existing container if it exists
                    bat "docker stop ${devopsprj} || exit 0"
                    bat "docker rm ${devopsprj} || exit 0"

                    // Run new container
                    bat "docker run -d -p 8081:80 --name ${devopsprj} ${devopsprj}:${v2}"
                }
            }
        }
    }

    post {
        failure {
            echo '❌ Build failed.'
        }
        success {
            echo '✅ Build and container run succeeded.'
        }
        always {
            echo '📦 Pipeline completed.'
        }
    }
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
