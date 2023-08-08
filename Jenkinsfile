pipeline {
    agent any
    stages {

        stage('Static Code Analysis') {
            // when {
            //     changeRequest()
            // }
            steps {
                // Perform static code analysis using the tool of your choice
             
                sh 'mvn checkstyle:checkstyle'
                    //change
            }
        }

        stage('Unit Tests') {
            // when {
            //     changeRequest()
            // }
            steps {
                // Run unit tests using Gradle
                sh 'mvn test'
            }
        }

        stage('Build') {
            // when {
            //     changeRequest()
            // }
            steps {
                // Build the project using Gradle
                sh 'mvn install'
            }
        }

        stage('Create docker image') {
            // when {
            //     changeRequest()
            // }
            steps {
                sh 'docker build --tag janduchnowski/mr .'
                sh 'docker login -u=janduchnowski -p=robot273' 
                sh 'docker tag janduchnowski/mr janduchnowski/petclinic:${GIT_COMMIT}'
              
            }
        }

        stage('Push Artifact to Artifact Storage') {
            // when {
            //         changeRequest()
            //     }
            steps {
                  sh 'docker push janduchnowski/petclinic:${GIT_COMMIT}'
            }
        }

//        MAIN
//=======================================================

        // stage("Hello") {
        // when {
        //     expression { 
        //     env.BRANCH_NAME == 'main' 
        //    }
        // }

        //     steps {
        //         echo "Hello"
        //     }
        // }

    }
}
