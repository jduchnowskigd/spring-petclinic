pipeline {
    agent any
    stages {

        stage('Static Code Analysis') {
            when {
                changeRequest()
            }
            steps {
                sh '/usr/local/bin/mvn checkstyle:checkstyle'  
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
                sh '/usr/local/bin/mvn install'
            }
        }

        stage('Create /usr/local/bin/docker image') {
            when {
                changeRequest()
            }
            steps {
                sh '/usr/local/bin/docker build --tag janduchnowski/mr .'
                sh '/usr/local/bin/docker login -u=janduchnowski -p=robot273' 
                sh '/usr/local/bin/docker tag janduchnowski/mr janduchnowski/petclinic:latest'
              
            }
        }

        stage('Push Artifact to Artifact Storage') {
            when {
                    changeRequest()
                }
            steps {
                  sh '/usr/local/bin/docker push janduchnowski/petclinic:latest'
            }
        }

//        MAIN
//=======================================================

        stage("Manual") {
        when {
            expression { 
            env.BRANCH_NAME == 'main' 
           }
        }

            steps {
                input message: 'Do you want to continue?'
                echo "ansible-playbook -i ansible/host-dev update.yml"
            }
        }

    }
}
