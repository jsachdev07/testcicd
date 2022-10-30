pipeline
{
	agent any
	stages
	{
		stage('Checkout')
		{
			steps
			{
				git 'https://github.com/jsachdev07/DevOpsClassCodes.git'
			}
		}
		
		stage('Compile')
		{
			steps
			{
				sh 'mvn compile'
			}
		}

		stage('Test')
		{
			steps
			{
				sh 'mvn test'
			}
		}

		stage('Build')
		{
			steps
			{
				sh 'mvn package'
			}
		}
		
		stage('Build Docker Image')
		{
			steps
			{
				sh 'sudo mkdir -p /code/$PROJECT_NAME/$BUILD_NUMBER'
				sh 'sudo cp /var/lib/jenkins/workspace/$PROJECT_NAME/target/addressbook.war /code/$PROJECT_NAME/$BUILD_NUMBER/'
				sh 'sudo cp /var/lib/jenkins/workspace/$PROJECT_NAME/Dockerfile /code/$PROJECT_NAME/$BUILD_NUMBER/'
				sh 'sudo docker build -f /code/$PROJECT_NAME/$BUILD_NUMBER/Dockerfile -t jsachdev07/ab-30Sep2021:$BUILD_NUMBER /code/$PROJECT_NAME/$BUILD_NUMBER'
			}
		}

		stage('Push Docker Image')
		{
			steps
			{
				sh 'sudo docker push jsachdev07/ab-30Sep2021:$BUILD_NUMBER'
			}
		}

		stage('Update Application')
		{
			steps
			{
				sh 'sudo docker run -itd -P jsachdev07/ab-30Sep2021:$BUILD_NUMBER'
			}
		}
		
	}
		
}
