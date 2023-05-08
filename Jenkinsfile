pipeline 
{
    agent any
    
    stages 
    {
         stage('Download in Master') 
        {
            when {
                branch "master"
            }
            steps
            {
                script
                {
                    def vars = readJSON file: './vars.json'
                    git '${vars.GITHUB_URL}'
                }
            }
        }
            stage('Download in staging') 
        {
            when {
                branch "test"
            }
            steps
            {
                script
                {
                    def vars = readJSON file: './vars.json'
                    git '${vars.GITHUB_URL}'
                }
            }
        }
         stage('cd') 
        {
            steps 
            {
                sh '''rm -rf /var/jenkins_home/workspace/new/node_modules
                cd /var/lib/jenkins/workspace/new/'''
            }
        }
        stage('npmi') 
        {
            steps 
            {
                sh '''sudo npm cache clean --force
                sudo npm ci'''
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
             sh 'sudo npm run build'
            }
        }
        stage('Deploy')
        {
            steps 
            {
                sh 'sudo scp -r build/* root@52.91.133.197:/var/www/html/'
            }
        }
    }
}
