pipeline {
  agent any
  stages {
    stage('checkout-scm'){
        steps {
            sh 'echo stage1'
            git branch: 'main', url: 'https://github.com/nareshdt99/mainproject.git'
        }
    }
    stage('compile'){
        steps {
            sh 'echo stage2'
            sh '/opt/maven/bin/mvn compile'
        }
    }    
    stage('test'){
        steps {
            sh 'echo stage3'
            sh '/opt/maven/bin/mvn test'   
        }
        
    }              
    stage('package'){
        steps {
            sh 'echo stage4'
            sh '/opt/maven/bin/mvn package' 
        }
    } 
    stage('build docker image'){
        steps {
            sh 'echo stage5'
            sh 'docker build -t nareshdt99/abctechnologies-1.0 .'    
        }                    
    }
    stage('push docker image to dockerhub'){
        steps {
            sh 'echo stage6'
            withCredentials([string(credentialsId: 'dockerhub', variable: 'dockerhub')]) {
            sh 'docker login -u nareshdt99 -p ${dockerhub}'  
            } 
            sh 'docker push nareshdt99/abctechnologies-1.0'  
        }                    
    }
    stage('ansible-docker integration & kubernetes deployment'){
        steps {
            sh 'echo stage7'
            ansiblePlaybook credentialsId: 'practice', disableHostKeyChecking: true, installation: 'ansible', inventory: 'myinv', playbook: 'ansible-docker.yml'
       }
    }
  }  
}
