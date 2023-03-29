pipeline 
{
    agent any
    stages 
    {
         stage('Download') 
        {
            steps
            {
                git 'https://github.com/Pridhviraj511/samplereact.git'
            }
        }
        stage('Build') 
        {
            steps 
            {
                sh '''sudo cd /var/lib/jenkins/workspace/new/
                sudo npm install'''
            }
        }
        stage('Test') 
        {
            steps 
            {
                sh './jenkins/scripts/test.sh'
            }
        }
        stage('Deliver') 
        {
            steps 
            {
                sh './jenkins/scripts/deliver.sh'
                input message: 'Finished using the web site? (Click "Proceed" to continue)'
                sh './jenkins/scripts/kill.sh'
            }
        }

    }
}
