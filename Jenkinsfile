pipeline {
    agent any
    
    stages {
        stage('GIT SCM checkout') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/vaibhavkaushik-10/building-website-nodejs-express.git'
            }    
        }
        
        stage('Packing source-code'){
            steps {
                sh 'tar -cvf node-app.tar *'
            }
        }
        
        stage('Landing code on deployment server'){
            steps {
                sshagent(['1']) {
                    // some block
                    sh 'scp -o StrictHostKeyChecking=no /var/lib/jenkins/workspace/pipe-1/node-app.tar ubuntu@<ip-address-of-deployment-server>:/home/ubuntu/deployment/'
                }
            }
        }
        
        stage('Un-packing source code'){
            steps {
                sshagent(['1']) {
                    sh 'ssh -t ubuntu@<ip-address-of-deployment-server> -o StrictHostKeyChecking=no "cd /home/ubuntu/deployment/ && tar -xvf node-app.tar -C /home/ubuntu/deployment/node-app/"'
                }    
            }
        }
    }
}
