pipeline {
    agent any
    
    // environment {
    //     GRADLE_HOME = tool name: 'Gradle', type: 'gradle'
    //     ARTIFACT_STORAGE_URL = 'https://your-artifact-storage.example.com/repo'
    // }

    stages {
        when {
            changeRequest target: 'main'
        }
        stage('Static Code Analysis') {
            steps {
                // Perform static code analysis using the tool of your choice (e.g., SonarQube, Checkstyle, etc.)
                // Use 'sh' to run shell commands or tools
                sh './gradlew checkstyleMain'
                // Add other static code analysis steps if needed
            }
        }

        stage('Unit Tests') {
            steps {
                // Run unit tests using Gradle
                sh './gradlew test'
                // Add other test steps if needed
            }
        }

        stage('Build') {
            steps {
                // Build the project using Gradle
                sh './gradlew build'
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



// pipeline {
//   agent any
  
//   stages {
    
//     stage('Deploy MR') {
//         when {
//             changeRequest target: 'main'
//         }
//       steps {
//           sh 'docker build --tag janduchnowski/mr .'
//           sh 'docker login -u=janduchnowski -p=robot273' 
//           sh 'docker tag janduchnowski/mr janduchnowski/mr:${GIT_COMMIT}'
//           sh 'docker push janduchnowski/mr:${GIT_COMMIT}'
//   }
// }


//     stage('Deploy') {
//         when {
//             expression { 
//             env.BRANCH_NAME == 'main' 
//            }
//         }

//     steps {

//         script {         
//           sh 'docker build --tag janduchnowski/main .'
//           sh 'docker login -u=janduchnowski -p=robot273' 
//           sh 'docker tag janduchnowski/main janduchnowski/main:latest'
//           sh 'docker push janduchnowski/main:latest'

//         }
//       }

//     }
//   }
// }
// // Example 