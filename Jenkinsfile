def dirExists(String path) {
    try {
        return file(path).isDirectory()
    } catch (Exception e) {
        return false
    }
}

pipeline {
    agent any
    environment {
        ARTIFACTORY_URL = 'http://13.201.102.58:8082/artifactory/application/'
        ARTIFACTORY_REPO = 'application/'
        ARTIFACTORY_PATH = 'http://13.201.102.58:8082/artifactory/application/com/example/white-app/1.0-SNAPSHOT/'
        AWS_REGION = 'ap-south-1'
        ECR_REPO_NAME = 'whiteapp'
        AWS_ACCOUNT_ID = '709087243859'
        ECR_REPO_URL = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}"
        DOCKER_IMAGE_NAME = 'application/whiteapp-image'
        DOCKER_IMAGE_TAG = "${ECR_REPO_URL}/${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}"

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
                script {
                    echo 'build starting'
                    sh 'mvn clean install'
                    echo 'build completed'
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    echo 'deploy starting'
                    sh 'mvn clean deploy'
                    echo 'deploy completed'
                }
            }
        }
        stage('push to jfrog-artifactory') {
            steps {
                dir('/var/lib/jenkins/workspace/Whiteapp/target') {
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
                    def ecrLoginCmd = "aws ecr get-login-password --region ${AWS_REGION}"
                    def ecrAuthToken = sh(script: ecrLoginCmd, returnStdout: true).trim()
                    
                    // Log in to Docker with the new token
                    script {
                        withCredentials([string(credentialsId: 'ecr-auth-token', variable: 'ECR_AUTH_TOKEN')]) {
                            sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin ${ECR_REPO_URL}"

                        }
                    }
                    
                    // Generate a unique tag for each build (timestamp-based)
                    def buildTag = env.BUILD_NUMBER
                    
                    // Tag the Docker image
                    sh "docker tag ${DOCKER_IMAGE_NAME}:latest ${ECR_REPO_URL}:${buildTag}"
                    
                    // Push the Docker image to ECR
                    sh "docker push ${ECR_REPO_URL}:${buildTag}"
                }
            }
        }
        stage('Push to ECR') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY', credentialsId: '709087243859']]) {
                        // Login to ECR
                        sh "aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_REPO_URL}"

                        // Generate a unique tag for each build (timestamp-based)
                        def buildTag = new Date().format("yyyyMMddHHmmss")

                        // Tag the Docker image
                        sh "docker tag ${DOCKER_IMAGE_NAME}:latest ${ECR_REPO_URL}:${buildTag}"

                        // Push the Docker image to ECR
                        sh "docker push ${ECR_REPO_URL}:${buildTag}"
                    }
                }
            }
        }
        stage('Deploy to Kubernetes') {
            steps {
                script {
                    // Check if the directory exists
                    if (!dirExists('helm-chart-assignment')) {
                        // Clone the Helm charts repository
                        sh 'git clone https://github.com/ymuralisanthosh/helm-charts-assignment.git'
                    }
        
                    // Upgrade/Install Helm chart
                    sh 'helm upgrade --install whiteapp helm-chart-assignment/assignment-apps/whiteapp'
                }
            }
        }
    }
}
    
