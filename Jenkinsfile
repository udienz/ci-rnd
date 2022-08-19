#!groovy

pipeline {
  agent any
  options {
    timestamps()
    ansiColor("xterm")
    buildDiscarder(logRotator(numToKeepStr: "100"))
    timeout(time: 2, unit: "HOURS")
  }
    stages {
        stage('Hello') {
            steps {
                sh 'printenv | sort'
                script {
                    if (env.GIT_BRANCH == 'main') 
                        {
                        echo 'Hello from main branch'
                        sh 'docker pull udienz/docker-ansible:jammy'
                        }
                    if (env.GIT_BRANCH == 'null') 
                        {
                        echo 'Hello from null branch'
                        sh 'docker pull udienz/docker-ansible:focal'
                        }
                    else {
                        sh "echo 'Hello from ${env.GIT_BRANCH} branch!'"
                        sh 'docker pull udienz/docker-ansible:centos7'
                        }
                    }
            }
        }
    }
  post {
    always {
      deleteDir()
    } // eol always
  } // eol post
}
