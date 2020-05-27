pipeline {
  agent any
   stages {
    stage('Build Docker image') {
      steps{
        script {
          sh "sudo docker ps" 
          sh "sudo docker build --no-cache -f Dockerfile ." 
          sh "sudo docker images"
        }
      }
    }    
  }
}
