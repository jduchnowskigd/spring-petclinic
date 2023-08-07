pipeline {
    agent any
    stages {

        stage('Static Code Analysis') {
            when {
                changeRequest()
            }
            steps {
                // Perform static code analysis using the tool of your choice
             
                sh '/usr/local/bin/mvn checkstyle:checkstyle'
                    //change
            }
        }

        stage('Unit Tests') {
            when {
                changeRequest()
            }
            steps {
                // Run unit tests using Gradle
                sh '/usr/local/bin/mvn test'
            }
        }

        stage('Build') {
            when {
                changeRequest()
            }
            steps {
                // Build the project using Gradle
                sh '/usr/local/bin/mvn install'
            }
        }

        stage('Create docker image') {
            when {
                changeRequest()
            }
            steps {
                sh '/usr/local/bin/docker build --tag janduchnowski/mr .'
                sh '/usr/local/bin/docker login -u=janduchnowski -p=robot273' 
                sh '/usr/local/bin/docker tag janduchnowski/mr janduchnowski/mr:${GIT_COMMIT}'
              
            }
        }

        stage('Push Artifact to Artifact Storage') {
            when {
                    changeRequest()
                }
            steps {
                  sh '/usr/local/bin/docker push janduchnowski/mr:${GIT_COMMIT}'
            }
        }

        stage("Hello") {
        when {
            expression { 
            env.BRANCH_NAME == 'main' 
           }
        }

            steps {
                echo "Hello"
            }
        }
    }
}
