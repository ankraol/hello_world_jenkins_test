pipeline {
    environment { 
        registry = "krasoana/hello_world" 

        registryCredential = 'dockerhub_id' 

        dockerImage = '' 

    }
    agent any

    stages {
        // stage('Cloning our Git') {
        //     steps {
        //         echo 'Cloning from GitHub...'
        //         git 'https://github.com/ankraol/hello_world_jenkins_test.git'
        //     }
        // }
        stage('Building image') {
            steps {
                echo 'Building image...'
                script {
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                }
            }
        }
        stage('Deploy image') {
            steps {
                echo 'Deploying image...'
                script {
                    docker.withRegistry('', registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }
        stage('Cleaning up') {
            steps {
                echo 'Cleaning up...'
                sh "docker rmi $registry:$BUILD_NUMBER"
            }
        }
    }
}