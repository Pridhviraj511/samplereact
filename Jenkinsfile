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
         stage('cd') 
        {
            steps 
            {
                sh ''' sudo rm -rf /var/lib/jenkins/workspace/new/node_modules
                cd /var/lib/jenkins/workspace/new/'''
            }
        }
        stage('npmi') 
        {
            steps 
            {
                sh '''sudo npm cache clean --force
                sudo npm i'''
            }
        }
         stage('Directories') 
        {
            steps 
            {
             sh '''sudo mkdir /var/lib/jenkins/workspace/new/node_modules/.cache
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
