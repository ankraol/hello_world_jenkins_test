pipeline {
  agent any
  tools {
    'org.jenkinsci.plugins.docker.commons.tools.DockerTool' 'docker'
  }
  environment {
    DOCKER_CERT_PATH = credentials('dockerhub_id')
    registry = "krasoana/hello_world" 
    dockerImage = '' 
  }
  stages {
    stage('Build image') {
        steps {
            echo 'Building image...'
            script {
                dockerImage = docker.build registry + ":$BUILD_NUMBER"
            }
        }
    }
    stage('Push image') {
        steps{
            // script {
            //     docker.withRegistry(registry, 'dockerhub_id') {
            //         dockerImage.push()
            //     }
            // }
            sh 'docker push $registry:latest'
        }
    }
    stage('Cleaning up') {
        steps {
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
  }
}