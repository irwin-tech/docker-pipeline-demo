pipeline {
  agent any
   stages {
    stage('Build Docker image') {
      steps{
        script {
          sh "docker build --no-cache -f Dockerfile ." 
          sh "docker images"
        }
      }
    }    
  }
}
