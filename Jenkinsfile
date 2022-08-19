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
                        }
                    if (env.GIT_BRANCH == 'null') 
                        {
                        echo 'Hello from null branch'
                        }
                    else {
                        sh "echo 'Hello from ${env.GIT_BRANCH} branch!'"
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
