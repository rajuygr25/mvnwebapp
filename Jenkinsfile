pipeline {
    agent any

    stages {
		stage('Clone-Repo') {
			steps {
				checkout scm
			}
		}
	
		stage('Build') {
			steps {
				sh 'mvn install -Dmaven.test.skip=true'
			}
		}
		
		stage('Unit Tests') {
			steps {
				sh 'mvn compiler:testCompile'
				sh 'mvn surefire:test'
				junit 'target/**/*.xml'
			}
		}

	
		stage('Deployment') {
			steps {
				sh 'sshpass -p "gamut" scp target/mvnwebapp.war gamut@172.17.0.4:/home/gamut/Distros/tomcat-9.0.43/webapps'
				sh 'sshpass -p "gamut" ssh gamut@172.17.0.4 "/home/gamut/Distros/tomcat-9.0.43/bin/startup.sh"'
	    	}
		}
    }
}