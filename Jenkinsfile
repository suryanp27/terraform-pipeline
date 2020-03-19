pipeline{
    agent any
    environment {
      PATH = "${PATH}:${getTerraformPath()}"
}
    stages{
        stage('s3 - crate bucket'){
          steps{
              sh "ansible-playbook s3-bucket.yml"
          }
        } 
        stage('terraform init and apply dev'){
            steps{
              sh returnStatus: true, script: 'terraform workspace new dev'
              sh "terraform init"
              sh "ansible-playbook terraform.yml"
          }
        }  
        stage('terraform init and apply Prod'){
            steps{
              sh returnStatus: true, script: 'terraform workspace new prod'
              sh "terraform init"
              sh "ansible-playbook terraform.yml -e app_env=prod"
          }
        }  
    }   
}
def getTerraformPath(){
    def tfHome = tool name: 'terraform-12', type: 'terraform'
    return tfHome
}

