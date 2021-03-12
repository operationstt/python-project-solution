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
                        sh 'scp -o StrictHostKeyChecking=no -i ${privatefile} ./* ubuntu@18.191.205.199:~/'			
						sh 'ssh -o StrictHostKeyChecking=no -i ${privatefile} ubuntu@18.191.205.199 bash build.sh'
		 }
		}
	}
	stage ('Test and Deployment to server node') {
            steps {                
                withCredentials([sshUserPrivateKey(credentialsId: 'python', keyFileVariable: 'privatefile', passphraseVariable: '', usernameVariable: 'username')]) {                                 
					sh 'ssh -o StrictHostKeyChecking=no -i ${privatefile} ubuntu@18.191.205.199 bash start.sh'  
				}
            }
	    }
    }
}    
