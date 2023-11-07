pipeline{
    agent any
    
    stages{
        stage("Code"){
            steps {
                echo "Cloning the code"
                git url:"https://github.com/darshanchavan1211/github-repo.git",branch: "main"
            }
            
        }
        stage("Build"){
            steps {
                echo "Building the code"
                sh "docker build -t web-app ."
                emailext body: 'java code build', subject: 'java code build', to: 'darshanchavan123@gmail.com'
            }    
            
        }
        stage("Push to ECR"){
            steps {
                script {
                    sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 356417641411.dkr.ecr.ap-south-1.amazonaws.com"
                    sh "aws ecr create-repository --repository-name web-app --region ap-south-1"
                    sh "docker tag web-app:latest 356417641411.dkr.ecr.ap-south-1.amazonaws.com/web-app:latest"
                    sh "docker push 356417641411.dkr.ecr.ap-south-1.amazonaws.com/web-app:latest"
                }
            
            }
            
        
        }
        stage("Deploy"){
            steps {
                sh "docker run -d -p 80:80 356417641411.dkr.ecr.ap-south-1.amazonaws.com/testing-repo:latest"
               
            }   
            
        }
    }
}

