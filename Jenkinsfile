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
                sudo npm ci
                sudo rm -rf /var/lib/jenkins/workspace/new/node_modules/.cache
                sudo mkdir /var/lib/jenkins/workspace/new/node_modules/.cache
                sudo chmod -R 777 /var/lib/jenkins/workspace/new/node_modules/.cache
                sudo npm run build'''
            }
        }
        stage('Deploy')
        {
            steps 
            {
                sh 'sudo scp -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no build/* ec2-user@34.229.137.219:/usr/share/nginx/html/'
            }
        }
    }
}
