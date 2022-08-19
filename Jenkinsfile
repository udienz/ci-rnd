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
  stage("Deploy"){
    if(env.BRANCH_NAME == 'main'){
      steps {
        echo 'This is main branch'
        sh 'docker pull udienz/docker-ansible:jammy'
      }
    }
    if(env.BRANCH_NAME != 'main'){
      steps {
        echo 'This is not main branch'
        sh 'docker pull udienz/docker-ansible:focal'
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
