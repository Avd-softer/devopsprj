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
                    bat "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Stop Existing Container (if any)') {
            steps {
                script {
                    bat "docker stop ${CONTAINER_NAME} || exit 0"
                    bat "docker rm ${CONTAINER_NAME} || exit 0"
                }
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    bat "docker run -d --name ${CONTAINER_NAME} -p 8081:80 ${IMAGE_NAME}:${IMAGE_TAG}"
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
