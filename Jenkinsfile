pipeline {
    agent { label  "agentfarm" }

    stages {
        stage('Delete the Workspace') {
            steps {
                sh 'sudo rm -rf $WORKSPACE/*'
            }
        }
	 stage('Pull Source Code') {
            steps {
				git credentialsId: 'hp', url: 'git@github.com:operationstt/java-project-solution.git'
            }
        }
    
    stage ('Test and Build') {
        steps {                
				sh '$WORKSPACE/build.sh'
            }
	    }
	stage ('Deployment to server node') {
            steps {                
                withCredentials([sshUserPrivateKey(credentialsId: 'python', keyFileVariable: 'privatefile', passphraseVariable: '', usernameVariable: 'username')]) {             
                    sh 'scp -o StrictHostKeyChecking=no -i ${privatefile} ./* ubuntu@18.191.205.199:~/'
					sh 'ssh -o StrictHostKeyChecking=no -i ${privatefile} ubuntu@18.191.205.199 bash start.sh'  
				}
            }
	    }
    }
}    
