// pipeline {
//     agent any
//         when {
//             changeReques()
//         }
//     stages {

//         stage('Static Code Analysis') {
//             steps {
//                 // Perform static code analysis using the tool of your choice
             
//                 sh '/usr/local/bin/mvn checkstyle:checkstyle'
//                     //change123
//             }
//         }

//         stage('Unit Tests') {
//             steps {
//                 // Run unit tests using Gradle
//                 sh '/usr/local/bin/mvn test'
//             }
//         }

//         stage('Build') {
//             steps {
//                 // Build the project using Gradle
//                 sh '/usr/local/bin/mvn install'
//             }
//         }

//         stage('Create docker image') {
//             steps {
//                 sh '/usr/local/bin/docker build --tag janduchnowski/mr .'
//                 sh '/usr/local/bin/docker login -u=janduchnowski -p=robot273' 
//                 sh '/usr/local/bin/docker tag janduchnowski/mr janduchnowski/mr:${GIT_COMMIT}'
              
//             }
//         }

//         stage('Push Artifact to Artifact Storage') {
//             steps {
//                   sh '/usr/local/bin/docker push janduchnowski/mr:${GIT_COMMIT}'
//             }
//         }
//     }
// }


pipeline {
    agent any


        stages {
                    when {
            expression { 
            env.BRANCH_NAME == 'main' 
           }
        }

            stage('Hello') {
                echo 'Hello World'
            }
        }
}