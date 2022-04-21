pipeline {
  agent any
  tools {
    // a bit ugly because there is no `@Symbol` annotation for the DockerTool
    // see the discussion about this in PR 77 and PR 52: 
    // https://github.com/jenkinsci/docker-commons-plugin/pull/77#discussion_r280910822
    // https://github.com/jenkinsci/docker-commons-plugin/pull/52
    'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'docker'
  }
  environment {
    DOCKER_CERT_PATH = credentials('dockerhub_id')
  }
  stages {
    stage('foo') {
      steps {
        sh "docker version" // DOCKER_CERT_PATH is automatically picked up by the Docker client
      }
    }
  }
}

// node {
//     environment { 
//         registry = "krasoana/hello_world" 

//         registryCredential = 'dockerhub_id' 

//         dockerImage = '' 

//     }

//     def app

//     stage('Clone repository') {
//         checkout scm
//     }

//     stage('Build image') {
//         app = docker.build("getintodevops/hellonode")
//     }

//     stage('Test image') {
//         app.inside {
//             sh 'echo "Tests passed"'
//         }
//     }

//     stage('Push image') {
//         /* Finally, we'll push the image with two tags:
//          * First, the incremental build number from Jenkins
//          * Second, the 'latest' tag.
//          * Pushing multiple tags is cheap, as all the layers are reused. */
//         // docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
//         //     app.push("${env.BUILD_NUMBER}")
//         //     app.push("latest")
//         // }
//         docker.withRegistry('', registryCredential) {
//             dockerImage.push()
//         }
//     }
//     stage('Cleaning up') {
//         steps {
//             echo 'Cleaning up...'
//             sh "docker rmi $registry:$BUILD_NUMBER"
//         }
//     }
// }

// pipeline {
//     environment { 
//         registry = "krasoana/hello_world" 

//         registryCredential = 'dockerhub_id' 

//         dockerImage = '' 

//     }
//     agent any

//     stages {
//         // stage('Initialize') {
//         //     steps {
//         //         def dockerHome = tool 'myDocker'
//         //         env.PATH = "${dockerHome}/bin:${env.PATH}"
//         //     }
//         // }
//         stage('Building image') {
//             steps {
//                 echo 'Building image...'
//                 script {
//                     dockerImage = docker.build registry + ":$BUILD_NUMBER"
//                 }
//             }
//         }
//         stage('Deploy image') {
//             steps {
//                 echo 'Deploying image...'
//                 script {
//                     docker.withRegistry('', registryCredential) {
//                         dockerImage.push()
//                     }
//                 }
//             }
//         }
//         stage('Cleaning up') {
//             steps {
//                 echo 'Cleaning up...'
//                 sh "docker rmi $registry:$BUILD_NUMBER"
//             }
//         }
//     }
// }