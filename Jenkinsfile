pipeline {

   parameters {
    choice(name: 'action', choices: 'create\ndestroy', description: 'Create/update or destroy the cluster.')
	string(name: 'cluster', defaultValue : 'mycluster', description: "cluster name.")
	string(name: 'region', defaultValue : 'us-west-2', description: "AWS region.")
  }

  agent any
  stages {
    stage('checkout') {
        steps {
            git 'https://github.com/msquare25/Terraform-eks.git'
        }
    }
    stage('TF Plan') {
      when {
        expression { params.action == 'create' }
		}
		steps {
			
			    plan = params.cluster + '.plan'
				sh """
					terraform init
					terraform workspace new ${params.cluster} || true
					terraform workspace select ${params.cluster}
					terraform plan \
					    -var "region=${params.region}" \
					    -var "cluster_name=${params.cluster}" \
						-out ${plan}
					echo ${params.cluster}
				"""
      
      }
    }
    stage('Apply') {
      when {
        expression { params.action == 'create' }
		}
		steps {
			
				sh """
					terraform apply -auto-approve ${plan}
					aws eks update-kubeconfig --name ${params.cluster} --region ${params.region}
				"""
				sleep 30
				sh """
				kubectl get nodes
				kubectl apply -f namspace.yaml && sleep 10 && sed -i "s/externalName:.*/externalName: $(terraform output rds_endpoint | cut -d ':' -f1)/g" rds.yaml && kubectl apply -f . 
				"""
			
        }

    }
    stage('Destroy') {
      when {
        expression { params.action == 'destroy' }
      }
      steps {
        
				sh """
				terraform workspace select ${params.cluster}
				terraform destroy -auto-approve -var "region=${params.region}" \
					    -var "cluster_name=${params.cluster}" 
				"""
			
        }
      }

  }
}
