pipeline {
    agent any

    environment {
        IMAGE_NAME = 'devopsprj'
        IMAGE_TAG = 'v2'
        CONTAINER_NAME = 'devopsprj'
    }

    stages {
        stage('Checkout') {
            steps {
                git 'https://github.com/Avd-softer/devopsprj'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    bat "docker build -t ${devopsprj}:${devopsprj} ."
                }
            }
        }

        stage('Stop Existing Container (if any)') {
            steps {
                script {
                    bat "docker stop ${devopsprj} || exit 0"
                    bat "docker rm ${devopsprj} || exit 0"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    bat "docker run -d --name ${devopsprj} -p 8081:80 ${devopsprj}:${v2}"
                }
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully."
        }
        failure {
            echo "Pipeline failed."
        }
    }
}
