pipeline 
{
    agent any
    
    stages 
    {
         stage('Download') 
        {
            steps
            {
                sh 'sudo rm -f /var/lib/jenkins/workspace/new/*'
                git 'https://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@github.com/Pridhviraj511/samplereact.git'
            }
        }
         stage('cd') 
        {
            steps 
            {
                sh 'cd /var/lib/jenkins/workspace/new/'
            }
        }
        stage('npmi') 
        {
            steps 
            {
                sh 'sudo npm ci'
            }
        }
         stage('Directories') 
        {
            steps 
            {
             sh '''sudo rm -rf /var/lib/jenkins/workspace/new/node_modules/.cache
                sudo mkdir /var/lib/jenkins/workspace/new/node_modules/.cache
                sudo chmod -R 777 /var/lib/jenkins/workspace/new/node_modules/.cache'''
            }
        }
         stage('Build') 
        {
            steps 
            {
             sh 'npm run build'
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
