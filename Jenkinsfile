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
				git credentialsId: 'hp', url: 'git@github.com:operationstt/python-project-solution.git'
            }
        }
    
    stage ('Initialize an Envoirnment') {
            steps {                
                withCredentials([sshUserPrivateKey(credentialsId: 'python', keyFileVariable: 'privatefile', passphraseVariable: '', usernameVariable: 'username')]) {             
                        sh 'scp -o StrictHostKeyChecking=no -i ${privatefile} ./* ubuntu@3.19.56.143:~/'			
						sh 'ssh -o StrictHostKeyChecking=no -i ${privatefile} ubuntu@3.19.56.143 bash build.sh'
		 }
		}
	}
	stage ('Test and Deployment to server node') {
            steps {                
                withCredentials([sshUserPrivateKey(credentialsId: 'python', keyFileVariable: 'privatefile', passphraseVariable: '', usernameVariable: 'username')]) {                                 
					sh 'ssh -o StrictHostKeyChecking=no -i ${privatefile} ubuntu@3.19.56.143 bash start.sh'  
				}
            }
	    }
    }
}    
