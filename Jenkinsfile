pipeline {
   agent any

   stages {
    stage('Compile') {
     steps {
        sh(script: 'mvn compile')
        echo 'Compile...'
     }
   }
    stage('Unit Test') {
     steps {
        sh(script: 'mvn test')
        echo 'Unit Test...'
     }
   }
    stage('Code Quality') {
        steps {
            //withSonarQubeEnv('sonar_server') {
		//      sh "./gradlew sonarqube"
		     }
        
        echo 'Code Quality...'
	}
   }
    stage('Artifact Push') {
     steps {
            nexusArtifactUploader artifacts: [
                                    [
					    artifactId: 'myweb', 
					    classifier: '', 
					    file: 'target/my-app-0.0.14.war', 
					    type: 'war'
				       ]
	                            ], 
		                            credentialsId: 'e0f7d903-7b82-46f1-9b1e-c82b73a22ee4', 
		                            groupId: 'in.javahome', 
		                            nexusUrl: '192.168.0.251:8081', 
		                            nexusVersion: 'nexus3', 
		                            protocol: 'http', 
		                            repository: 'Simpleapp-release', 
		                            version: '0.0.14'

        echo 'Artifact Push...'
     }
   }
    stage('Deploy') {
     steps {
        echo 'Deploy...'
     }
   }
    stage('Smoke Test') {
     steps {
        echo 'Smoke Test...'
     }
   }
    stage('Functional Test') {
     steps {
        echo 'Functional Test...'
     }
   }
   stage('Email Notification') {
     steps {
        echo 'Email Notification...'
     }
   }
  }
}
