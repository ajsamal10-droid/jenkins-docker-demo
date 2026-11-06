pipeline {
    agent any

    environment {
        IMAGE_NAME = 'my-app'
        IMAGE_TAG  = "${env.BUILD_NUMBER}"
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/ajsamal10-droid/jenkins-docker-demo.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t ${IMAGE_NAME}:${IMAGE_TAG} -t ${IMAGE_NAME}:latest .'
            }
        }

        stage('Verify Image') {
            steps {
                sh 'docker images ${IMAGE_NAME}'
            }
        }
    }

    post {
        success {
            echo "Build succeeded: ${IMAGE_NAME}:${IMAGE_TAG}"
        }
        failure {
            echo 'Build failed. Sending Slack notification...'
            slackSend(
                channel: '#jenkins-alerts',
                color: 'danger',
                message: "FAILED: ${env.JOB_NAME} #${env.BUILD_NUMBER}\n${env.BUILD_URL}"
            )
        }
    }
}
