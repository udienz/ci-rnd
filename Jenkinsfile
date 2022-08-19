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
    stage("run if branch is master"){
      when {
        expression { env.BRANCH_NAME == 'master' }
      }
      steps {
        bitbucketStatusNotify(buildState: 'INPROGRESS')
        sh 'docker pull udienz/docker-ansible:jammy'
      } // steps
    } // stage      
  } // stages

  stages {
    stage("run if branch is not a master"){
      when {
        expression { env.BRANCH_NAME != 'master' }
      }
      steps {
        bitbucketStatusNotify(buildState: 'INPROGRESS')
        sh 'docker pull ubuntu:jammy'
      } // steps
    } // stage      
  } // stages

  post {
    always {
      deleteDir()
    } // eol always
  } // eol post
}
