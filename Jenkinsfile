pipeline {
    agent any
    environment {
        ARTIFACTORY_URL = 'http://13.201.102.58:8082/artifactory/application/'
        ARTIFACTORY_REPO = 'application/'
        ARTIFACTORY_PATH = 'http://13.201.102.58:8082/artifactory/application/com/example/white-app/1.0-SNAPSHOT/'
        AWS_REGION = 'ap-south-1'
        ECR_REPO_NAME = 'assignment-repo'
        AWS_ACCOUNT_ID = '709087243859'
        ECR_REPO_URL = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}"
        DOCKER_IMAGE_NAME = 'application/whiteapp-image'
        BUILD_NUMBER = env.BUILD_NUMBER

    }
    stages {
        stage('checkout') {
            steps {
                echo 'checkout starting'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ymuralisanthosh/whiteapp.git']])
                echo 'checkout completed'
            }
        }
        stage('Build') {
            steps {
              script{    
                echo 'build starting'
                sh 'mvn clean install'
                echo 'build completed'
              }    
            }
        }
        stage('deploy') {
            steps {
              script{    
                echo 'deploy starting'
                sh 'mvn clean deploy'
                echo 'deploy completed'
              }    
            }
        }
        stage('push to jfrog-artifactory') {
            steps {
                dir('/var/lib/jenkins/workspace/Whiteapp/target'){
                    script {
                        def buildNumber = env.BUILD_NUMBER
                        rtServer (
                            id: 'Artifactory-1',
                            url: 'http://13.201.102.58:8082/artifactory',
                            username: 'ymsanthosh',
                            password: 'Viratkohli_18',
                            bypassProxy: true,
                            timeout: 300
                        )
                        
                        rtUpload (
                            serverId: 'Artifactory-1',
                            spec: '''{
                                  "files": [
                                    {
                                      "pattern": "application-artifact.jar",
                                      "target": "application/${buildNumber}/"
                                     }
                                  ]
                            }''',
                        )
                    }    
                }  
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    def dockerBuildArgs = "--build-arg ARTIFACTORY_URL=${env.ARTIFACTORY_URL} --build-arg ARTIFACTORY_REPO=${env.ARTIFACTORY_REPO} --build-arg ARTIFACTORY_PATH=${env.ARTIFACTORY_PATH}"
                    env.DOCKER_IMAGE_TAG = "${ECR_REPO_URL}/${DOCKER_IMAGE_NAME}:${env.BUILD_NUMBER}"

                    sh "docker build ${dockerBuildArgs} -t ${env.DOCKER_IMAGE_TAG} ."
                }
            }
        }
        stage('Push to ECR') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY', credentialsId: '709087243859']]) {
                        sh "aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REPO_URL}"
                    }

                    // Push the Docker image to ECR using the dynamically generated tag
                    sh "docker push ${env.DOCKER_IMAGE_TAG}"
                }
            }
        }
    }
}

