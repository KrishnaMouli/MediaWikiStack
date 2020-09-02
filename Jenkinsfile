pipeline {

   parameters {
    choice(name: 'action', choices: 'create\ndestroy', description: 'Create/destroy the cluster.')
	string(name: 'cluster', defaultValue : 'mediawiki', description: "EKS cluster name.")
	string(name: 'region', defaultValue : 'us-east-1', description: "AWS region.")
  }

  agent any
  stages {
    stage('source_code_checkout') {
        steps {
            git 'https://github.com/KrishnaMouli/kstudy-thoughtworks.git'
        }
    }
    stage('Infra_Plan_TF') {
      when {
        expression { params.action == 'create' }
		}
		steps {
                      script {
			
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
    }
    stage('Infra_Apply_TF') {
      when {
        expression { params.action == 'create' }
		}
		steps {
                      script {
			
				sh """
					terraform apply -auto-approve ${plan}
					aws eks update-kubeconfig --name ${params.cluster} --region ${params.region}
				sleep 10
				kubectl get nodes
				kubectl apply -f namspace.yaml && sleep 10 && sed -i "s/externalName:.*/externalName: `terraform output endpoint | cut -d ':' -f1`/g" db_rds_k8s.yaml && kubectl apply -f .
			        sleep 30
			        (kubectl get svc -n thoughtworks | grep -i 80: | grep -i LoadBalancer | awk '{print \$4}')
				(kubectl get svc -n thoughtworks | grep -i ExternalName | awk '{print \$1}')
				sleep 60
				"""
		      }
        }

    }
    stage('Infra_Destroy_TF') {
      when {
        expression { params.action == 'destroy' }
      }
      steps {
        
				sh """
                                kubectl delete -f .
				terraform workspace select ${params.cluster}
				terraform destroy -auto-approve -var "region=${params.region}" \
					    -var "cluster_name=${params.cluster}" 
				"""
			
        }
      }

  }
}
