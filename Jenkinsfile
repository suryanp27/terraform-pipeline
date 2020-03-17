pipeline{
    agent any
    environment {
      PATH = "${PATH}:${getTerraformPath()}"
}
    stages{
        stage('s3 - crate bucket'){
          steps{
              script{
              createS3Bucket('terraform-jenkins-2020')
              }
          }
        } 
        stage('terraform init and apply dev'){
            steps{
              sh returnStatus: true, script: 'terraform workspace new dev'
              sh "terraform init"
              sh "terraform apply -var-file=dev.tfvars -auto-approve"
          }
        }  
        stage('terraform init and apply Prod'){
            steps{
              sh returnStatus: true, script: 'terraform workspace new prod'
              sh "terraform init"
              sh "terraform apply -var-file=prod.tfvars -auto-approve"
          }
        }  
    }   
}
def getTerraformPath(){
    def tfHome = tool name: 'terraform-12', type: 'terraform'
    return tfHome
}
def createS3Bucket(bucketName){
    sh returnStatus: true, script: "aws s3 mb ${bucketName} --region=ap-south-1"
}
