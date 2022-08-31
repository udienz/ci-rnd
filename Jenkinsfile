#!groovy

pipeline {
  agent any
  options {
    timestamps()
    ansiColor("xterm")
    buildDiscarder(logRotator(numToKeepStr: "100"))
    timeout(time: 2, unit: "HOURS")
  }
  environment {
      REPOS = 'udienz/ci-rnd'
  }
    stages {
        stage("publish status") {
            steps {
                withCredentials([string(credentialsId: 'bde8f904-5da4-459b-b8c6-844281315ff7', variable: 'GITHUB_TOKEN')]) {
                  sh 'bash scripts/inprogress.sh'
                }
            }
        }
        stage("main") {
        // check if the current branch is main
            when { expression { env.GIT_BRANCH == 'origin/main' } }
            steps {
                  sh 'printenv | sort'
                  echo "This is origin/main"
                }
        }
        stage("not main") {
        // check if the current branch is not main
            when { expression { env.GIT_BRANCH != 'origin/main' } }
            steps {
                  sh 'printenv | sort'
                  echo "This is not origin/main"
            }
        }
    }
  post {
    success {
        withCredentials([string(credentialsId: 'bde8f904-5da4-459b-b8c6-844281315ff7', variable: 'GITHUB_TOKEN')]) {
              sh 'bash scripts/success.sh'
        }
    }
    unsuccessful {
        withCredentials([string(credentialsId: 'bde8f904-5da4-459b-b8c6-844281315ff7', variable: 'GITHUB_TOKEN')]) {
              sh 'bash scripts/failure.sh'
        }
    }
  } // eol post
}
