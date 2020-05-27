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
         docker.withRegistry('700707367057.dkr.ecr.us-east-1.amazonaws.com', 'ecr:us-east-1:aws-credential') {
           sh "docker push 700707367057.dkr.ecr.us-east-1.amazonaws.com/php-demo:latest"
         }
       }
      }
    }    
  }
}
