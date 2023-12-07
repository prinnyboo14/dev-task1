pipeline {

    agent any

    stages {

         stage('Init') {

            steps {

                sh 'docker rm -f $(docker ps -qa) || true'

                sh 'docker network create new-network || true'

            }

        }

        stage('Build') {

            steps {

                sh '''
                docker build -t beth111/flask-app:latest -t beth111/flask-app:v${BUILD_NUMBER}  .

                docker build -t beth111/mynginx:latest -t beth111/mynginx:v${BUILD_NUMBER} -f Dockerfile.nginx .
                '''

            }

        }

                stage('Push') {

            steps {

                sh '''
                docker push beth111/flask-app:latest

                docker push beth111/flask-app:v${BUILD_NUMBER} 

                docker push beth111/mynginx:latest

                docker push beth111/mynginx:v${BUILD_NUMBER}
                '''

            }

        }

        stage('Deploy') {

            steps {

                sh 'docker run -d --name flask-app --network new-network beth111/flask-app:latest'

                sh 'docker run -d -p 80:80 --name mynginx --network new-network beth111/mynginx:latest'

            }

        }

        stage('CleanUp') {
            steps {
                sh 'docker system prune -f'
            }
        }

    }

}
