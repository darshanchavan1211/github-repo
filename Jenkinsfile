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
                emailext body: 'java code build', subject: 'java code build', to: 'darshanchavan599@gmail.com'
            }    
            
        }
        stage("Push to ECR"){
            steps {
                script {
                    sh "aws ecr get-login-password --region ap-south-1 | docker login --username AWS --password-stdin 356417641411.dkr.ecr.ap-south-1.amazonaws.com"
                    sh "docker build -t testing-repo ."
                    sh "docker tag testing-repo:latest 356417641411.dkr.ecr.ap-south-1.amazonaws.com/testing-repo:latest"
                    sh "docker push 356417641411.dkr.ecr.ap-south-1.amazonaws.com/testing-repo:latest"
                }
            
            }
            
        
        }
        stage("Deploy"){
            steps {
                sh "docker run -d -p 80:80 --rm --name myDemoContainer 356417641411.dkr.ecr.ap-south-1.amazonaws.com/testing-repo:latest"
               
            }   
            
        }
    }
}

