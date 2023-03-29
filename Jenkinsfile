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
                sudo npm install
                sudo npm run build'''
            }
        }
        stage('Deploy')
        {
            steps 
            {
                sh 'sudo scp -r build/* ec2-user@34.229.137.219:/usr/share/nginx/html/'
            }
        }
    }
}
