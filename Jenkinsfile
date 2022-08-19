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
    stage("check branch"){
      when {
        expression { env.BRANCH_NAME == 'master' }
      }
      steps {
        bitbucketStatusNotify(buildState: 'INPROGRESS')
        sh 'docker pull udienz/docker-ansible:jammy'
      } // steps
    } // stage      
  } // stages
  post {
    always {
      deleteDir()
    } // eol always
  } // eol post
}
