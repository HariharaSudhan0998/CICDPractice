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
           // withSonarQubeEnv('sonar_server') {
		    // sh "./gradlew sonarqube"
		        }
        
        echo 'Code Quality...'
	}
   }
    stage('Artifact Push') {
     steps {
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
			     sleep 60       
			     sh "./smoke_test.sh"   
		     
	     
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
