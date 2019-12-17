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
    withCredentials([usernamePassword(credentialsId: '49f6ee20-b6f5-4824-af41-88deb5f5180c', passwordVariable: 'docker_passwd', usernameVariable: 'decker_user')]) {
     sh 'docker login -u ${docker_user} -p '
     sh 'echo ${docker_passwd}'
     sh 'docker push sivaramsajeev/jg-webapp'
	}
    }
    
    
}