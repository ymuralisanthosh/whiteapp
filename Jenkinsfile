pipeline {
    agent any
    environment {
        AWS_REGION = 'ap-south-2'
        ECR_REPO_NAME = 'whiteapp'
        AWS_ACCOUNT_ID = '585008055705'
        ECR_REPO_URL = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO_NAME}"
        DOCKER_IMAGE_NAME = 'whiteapp-image'
        DOCKER_IMAGE_TAG = "${ECR_REPO_URL}/${DOCKER_IMAGE_NAME}:${BUILD_NUMBER}"

    }
    stages {
        stage('checkout') {
            steps {
                echo 'checkout starting'
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/ymuralisanthosh/whiteapp.git']])
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
       
                stage('Build Docker Image') {
            steps {
                script {
                  def buildTag = new Date().format("yyyyMMddHHmmss") 
                  sh "docker build -t ${ECR_REPO_URL}:${buildTag} ."
                }
            }
        }

        stage('Push to ECR') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY', credentialsId: '585008055705']]) {
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
                    // Print kubeconfig contents
                    sh "cat ${kubeconfigPath}"
        
                    // Clone the Helm charts repository
                    sh 'git clone https://github.com/ymuralisanthosh/helm-charts-assignment.git'
                    echo 'cloned'
        
                    // Upgrade/Install Helm chart with kubeconfig specified
                    sh "/usr/local/bin/helm upgrade --install whiteapp assignment-apps/charts/whiteapp --kubeconfig=${kubeconfigPath}"
                }
            }
        }       
    }
}
    
