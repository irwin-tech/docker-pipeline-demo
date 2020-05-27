pipeline {
  agent any
  parameters {
        //string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')

        //text(name: 'BIOGRAPHY', defaultValue: '', description: 'Enter some information about the person')

        //booleanParam(name: 'TOGGLE', defaultValue: true, description: 'Toggle this value')

        choice(name: 'DockerImage', choices: ['All', 'Dockerfile', 'gateway', 'users', 'plans', 'integrations'], description: 'Select a docker image to build')
   }
   stages {
    stage('Build Docker image') {
      steps{
        script {
          //echo "Hello ${params.PERSON}"

                //echo "Biography: ${params.BIOGRAPHY}"

                //echo "Toggle: ${params.TOGGLE}"

          echo "Selectd Docker Image: ${params.DockerImage}"
          if(params.DockerImage == 'All'){
            echo 'All has been selected';
          }
          else if(params.DockerImage == 'Dockerfile')
          else{
            sh "docker build --no-cache -t 700707367057.dkr.ecr.us-east-1.amazonaws.com/php-demo:latest -f Dockerfile ." 
            sh "docker images"
          }
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
         sh "./dev-php-demo-ecs-deploy.sh"
       }
      }
    }    
  }
}
