pipeline {
  agent any
   stages {
    stage('Build Docker image') {
      steps{
        script {
          sh "docker build --no-cache -t 700707367057.dkr.ecr.us-east-1.amazonaws.com/php-demo:latest -f Dockerfile ." 
          sh "docker images"
        }
      }
    }
     stage('Push Docker image') {
       steps{
        script {
          sh "eval \$(aws ecr get-login --no-include-email --region us-east-1)"
          sh "docker push 700707367057.dkr.ecr.us-east-1.amazonaws.com/php-demo:latest"
       }
      }
    }
     stage('Deploy Docker image') {
       steps{
        script {
         sh './ecs-deploy.sh "php-demo" "latest"'
       }
      }
    }    
  }
}
