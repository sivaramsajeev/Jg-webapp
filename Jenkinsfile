node {
 stage("git pull"){
     git 'https://github.com/sivaramsajeev/Jg-webapp.git'
    }
    
    stage("maven build"){
     sh '/usr/local/bin/mvn clean install'
    }
    
    stage("Tomcat deploy"){
    deploy adapters: [tomcat8(credentialsId: '52efbdfc-8ece-48d8-a2fa-9cc2efbd8da5', path: '', url: 'http://52.252.161.96:8080/')], contextPath: 'Jg-web', onFailure: false, war: '**/*.war' 
    }
    
    stage("Docker build"){
        sh 'docker build -t sivaramsajeev/jg-webapp .'
    }
    
    stage("Docker hub push"){
    withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
    	sh 'docker login -u $DOCKER_USERNAME  -p $DOCKER_PASSWORD'
    	sh 'docker push sivaramsajeev/jg-webapp'
		}
     }
    
    stage("docker run"){
    sshPublisher(publishers: [sshPublisherDesc(configName: 'DeploymentSlave', transfers: [sshTransfer(cleanRemote: false, excludes: '', execCommand: 'sudo docker ps | grep -v CONTAINER | cut -d" " -f1 | xargs sudo docker rm -f;sudo docker run -itd -p 9090:8080 sivaramsajeev/jg-webapp', execTimeout: 120000, flatten: false, makeEmptyDirs: false, noDefaultExcludes: false, patternSeparator: '[, ]+', remoteDirectory: '', remoteDirectorySDF: false, removePrefix: '', sourceFiles: '')], usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false)])
    
    }
	
    stage('SonarQube analysis') {
    // requires SonarQube Scanner 2.8+
    def scannerHome = tool 'SonarQube Scanner 2.8';
    withSonarQubeEnv('SonarQube Scanner') {
      sh "${scannerHome}/bin/sonar-scanner"
    }
  }
	
	
		
}
