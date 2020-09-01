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

•	Once job deployed successfully endpoint url and db name will get printed in the job console output as shown below.
 
![alt text](https://mediaimag.s3-us-west-2.amazonaws.com/media-3.JPG)

•	Access the app by using that endpoint , configure db with the db name.

•	Coming to db authentication you can use username and password which we provided through terraform.tfvars file

# Expected Output

Access the application.

![alt text](https://mediaimag.s3-us-west-2.amazonaws.com/media-1.JPG)

After configuring DB.

![alt text](https://mediaimag.s3-us-west-2.amazonaws.com/media-2.JPG)

Final result

![alt text](https://mediaimag.s3-us-west-2.amazonaws.com/media-4.JPG)

