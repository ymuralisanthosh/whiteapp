pipeline {
    agent any

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
                                      "pattern": "application-artifact.war",
                                      "target": "application/${buildNumber}/"
                                     }
                                  ]
                            }''',
                        )
                    }    
                }  
            }
        }
    }
}

