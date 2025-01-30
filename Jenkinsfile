pipeline {
    agent any
    stages {
         stage('Build Docker Image') {
            steps {
                script {
                    // Build Docker image
                    sh 'docker build -t vengat001/dev:latest .'
                }
            }
        }
        stage('Push to DockerHub') {
            steps {
                script {
                    // Login to DockerHub using the Personal Access Token
                    sh "docker login -u vengat001 -p dckr_pat_bbWUpf4AuIqNsDdfkHXIW4jlXcY"
                    
                    // Push images to DockerHub
                    sh 'docker push vengat001/dev:latest'
                }
            }
        }
    }
}

