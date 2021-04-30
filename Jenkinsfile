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
	sh(script: 'mvn package')
        echo 'Unit Test...'
     }
   }
    stage('Code Quality') {
     steps {
            //withSonarQubeEnv('sonar_server') {
		   //  sh "./gradlew sonarqube"
		     //   }
        
        echo 'Code Quality...'
	}
   }
    stage('Artifact Push') {
     steps {
	     mvn sonar:sonar \
                   -Dsonar.projectKey=sonarqube-testing \
                   -Dsonar.host.url=http://192.168.0.251:9000 \
                   -Dsonar.login=64289b29b80c25f532e0ae7c28bdf790a8b654c1
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
			     // sleep 60       
			    // sh "./smoke_test.sh"   
		     
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
