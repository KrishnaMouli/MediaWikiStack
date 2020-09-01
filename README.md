# Technologies used to deploy mediawiki application
   
    •  Terraform 
    •  Kubernates 
    •  AWS
    •  Jenkins 

# Objective

•	To automate the deployment of MediaWiki.

# Process/Steps needs to follow

•	Create a Jenkins pipeline job.

•	Choose SCM as GIT.

•	Provide this repo URL as Repository URL.

•	Script path as Jenkinsfile.

•	Run the Job.

•	Once job deployed successfully endpoint url and db name will get printed in the job console output.

•	Access the app by using that endpoint , configure db with the db name.

•	Coming to db authentication you can use username and password which we provided through terraform.tfvars file
