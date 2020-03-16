pipeline{
    agent any
    environment {
      PATH = "${PATH}:${getTerraformPath()}"
}
    stages{
        stage('terraform init and apply dev'){
            steps{
              sh returnStatus: true, script: 'terrafrom workspace new dev'
              sh "terraform init"
              sh "terrafrom apply -var-file"=dev.tfvars
          }
        }  
    stage('terraform init and apply Prod'){
            steps{
              sh returnStatus: true, script: 'terrafrom workspace new prod'
              sh "terraform init"
              sh "terrafrom apply -var-file"=prod.tfvars
          }
        }  
    }   
}
def getTerraformPath(){
    def tfHome = tool name: 'terraform-12', type: 'terraform'
    return tfHome
}
