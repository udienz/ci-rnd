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
        stage('Deploy') {
            parallel {
                stage("main") {
                    when { expression { env.GIT_BRANCH == 'origin/main' } }
                    steps {
                          sh 'printenv | sort'
                          echo "This is origin/main"
                        }
                }
                stage("not main") {
                    when { expression { env.GIT_BRANCH != 'origin/main' } }
                    steps {
                          sh 'printenv | sort'
                          echo "This is not origin/main"
                    }
                }
            }
        }
    }
  post {
    always {
      deleteDir()
    } // eol always
    success {
        withCredentials([string(credentialsId: 'bde8f904-5da4-459b-b8c6-844281315ff7', variable: 'GITHUB_TOKEN')]) {
              sh 'bash script/success.sh'
        }
    }
    failure {
        withCredentials([string(credentialsId: 'bde8f904-5da4-459b-b8c6-844281315ff7', variable: 'GITHUB_TOKEN')]) {
              sh 'bash script/failure.sh'
        }
    }

  } // eol post
}
