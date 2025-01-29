pipeline {
    agent any
    stages {
         stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t vengat001/prod:latest .'
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                script {
                    // Login to DockerHub using the Personal Access Token
                    sh "echo $DOCKER_CREDENTIALS_PSWD | docker login -u $DOCKER_CREDENTIALS_USR --password-stdin"
                    
                    // Push images to DockerHub
                    sh 'docker push vengat001/prod:latest’
                }
            }
        }
    }
}

