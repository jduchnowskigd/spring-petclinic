pipeline {
    agent any
    
    stages {

        stage('Static Code Analysis') {
            steps {
                // Perform static code analysis using the tool of your choice
             
                sh 'mvn checkstyle:checkstyle'
  
            }
        }

        stage('Unit Tests') {
            steps {
                // Run unit tests using Gradle
                sh 'mvn test'
            }
        }

        stage('Build') {
            steps {
                // Build the project using Gradle
                sh 'mvn install'
            }
        }

        stage('Create docker image') {
            steps {
                sh 'docker build --tag janduchnowski/mr .'
                sh 'docker login -u=janduchnowski -p=robot273' 
                sh 'docker tag janduchnowski/mr janduchnowski/mr:${GIT_COMMIT}'
              
            }
        }

        stage('Push Artifact to Artifact Storage') {
            steps {
                  sh 'docker push janduchnowski/mr:${GIT_COMMIT}'
            }
        }
    }
}
