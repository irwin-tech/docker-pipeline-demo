pipeline {
  agent any
   stages {
    stage('Build Docker image') {
      steps{
        script {
           docker build "Dockerfile:1" 
           sh "docker images"
        }
      }
    }    
  }
}
