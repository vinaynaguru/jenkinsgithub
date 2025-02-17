pipeline {
    agent any

    environment {
        AWS_ACCESS_KEY_ID = credentials('aws-access')
        AWS_SECRET_ACCESS_KEY = credentials('aws-secret')
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/vinaynaguru/terraform-webserver.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                script {
                    // Install unzip
                    sh 'sudo apt-get update -y'
                    sh 'sudo apt-get install -y unzip'

                    // Download Terraform
                    sh 'wget https://releases.hashicorp.com/terraform/1.5.0/terraform_1.5.0_linux_amd64.zip'
                    
                    // Unzip Terraform
                    sh 'unzip terraform_1.5.0_linux_amd64.zip'
                    
                    // Move terraform binary to a directory in PATH
                    sh 'sudo mv terraform /usr/local/bin/'

                    // Verify Terraform installation
                    sh 'terraform -v'
                }
            }
        }

        stage('Initialize Terraform') {
            steps {
                sh 'terraform init'
            }
        }

        stage('Plan Terraform Deployment') {
            steps {
                sh 'terraform plan'
            }
        }

        stage('Apply Terraform Deployment') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }

    post {
        always {
            script {
                def userChoice = input message: 'Do you want to destroy the infrastructure?', parameters: [
                    choice(name: 'Destroy', choices: ['No', 'Yes'], description: 'Select Yes to destroy the web server')
                ]
                if (userChoice == 'Yes') {
                    stage('Destroy Infrastructure') {
                        steps {
                            sh 'terraform destroy -auto-approve'
                        }
                    }
                } else {
                    echo "Skipping destroy step."
                }
            }
        }
    }
}
