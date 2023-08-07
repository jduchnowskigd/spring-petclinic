pipeline {
    agent any
        when {
            changeRequest target: 'main'
        }
    stages {

        stage('Static Code Analysis') {
            steps {
                // Perform static code analysis using the tool of your choice
             
                sh '/usr/local/bin/mvn checkstyle:checkstyle'
                    //change
            }
        }

        stage('Unit Tests') {
            steps {
                // Run unit tests using Gradle
                sh '/usr/local/bin/mvn test'
            }
        }

        stage('Build') {
            steps {
                // Build the project using Gradle
                sh '/usr/local/bin/mvn install'
            }
        }

        stage('Create docker image') {
            steps {
                sh '/usr/local/bin/docker build --tag janduchnowski/mr .'
                sh '/usr/local/bin/docker login -u=janduchnowski -p=robot273' 
                sh '/usr/local/bin/docker tag janduchnowski/mr janduchnowski/mr:${GIT_COMMIT}'
              
            }
        }

        stage('Push Artifact to Artifact Storage') {
            steps {
                  sh '/usr/local/bin/docker push janduchnowski/mr:${GIT_COMMIT}'
            }
        }
    }
}


pipeline {
    agent any
        when {
            branch "main"
        }

        stages {
            stage('Hello') {
                echo 'Hello World'
            }
        }
}