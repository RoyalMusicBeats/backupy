pipeline {
    agent {
        label 'test-prod-boz-001'
    }
    options {
        buildDiscarder(logRotator(numToKeepStr: '10', daysToKeepStr: '60'))
        parallelsAlwaysFailFast()
    }
    stages {
        stage('Clone repository') {
            steps {
                checkout scm
            }
        }
        stage('Build image') {
            steps {
                script {
                    app = docker.build("backupy/backupy")
                }
            }
        }
        stage('Create docker-compose file') {
            steps {
                sh 'echo "version: \'3\'" > docker-compose.yml'
                sh 'echo "services:" >> docker-compose.yml'
                sh 'echo "  app:" >> docker-compose.yml'
                sh 'echo "    image: backupy/backupy" >> docker-compose.yml'
                sh 'echo "    container_name: backupy" >> docker-compose.yml'
                sh 'echo "    hostname: backupy" >> docker-compose.yml'
                sh 'echo "    ports:" >> docker-compose.yml'
                sh 'echo "      - 445:445" >> docker-compose.yml'
                sh 'echo "    environment:" >> docker-compose.yml'
                sh 'echo "      - TZ=Europe/Amsterdam" >> docker-compose.yml'
            }
        }
        stage('Execute docker-compose up') {
            steps {
                sh 'docker-compose up -d'
            }
        }
        stage('Testing') {
            steps {
                input "Testing done?"
            }
        }
        stage('Execute docker-compose down') {
            steps {
                sh 'docker-compose down'
            }
        }
        stage('Approval to Prod') {
            steps {
                input "Deploy to production?"
            }
        }
        stage('Push image to prod registry') {
            steps {
                script {
                    docker.withRegistry('https://cm-prod-boz-001.tail118e1.ts.net') {
                        app.push("${env.BUILD_NUMBER}")
                        app.push("latest")
                    }
                }
            }
        }
    }
}