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
    stage('foo') {
      steps {
        sh "docker version" // DOCKER_CERT_PATH is automatically picked up by the Docker client
      }
    }
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
            script {
                docker.withRegistry('', 'dockerhub_id') {
                    dockerImage.push()
                }
            }
        }
    }
    stage('Cleaning up') {
        steps {
            sh "docker rmi $registry:$BUILD_NUMBER"
        }
    }
  }
}