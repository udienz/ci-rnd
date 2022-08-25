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
                stage("") {
                    steps {
                        withCredentials([string(credentialsId: 'bde8f904-5da4-459b-b8c6-844281315ff7', variable: 'GITHUB_TOKEN')]) {
                          sh '''
                          curl "https://api.GitHub.com/repos/udienz/ci-rnd/statuses/$GIT_COMMIT" \
                            -H "Content-Type: application/json" \
                            -H "Authorization: token $GITHUB_TOKEN" \
                            -H "Accept: application/vnd.github+json" \
                            -X POST \
                            -d "{\"state\": \"pending\",\"context\": \"continuous-integration/jenkins\", \"description\": \"Jenkins\"}"
                          '''
                        }
                    }
                }
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
    success {
        withCredentials([string(credentialsId: 'bde8f904-5da4-459b-b8c6-844281315ff7', variable: 'GITHUB_TOKEN')]) {
              sh '''
                  curl "https://api.GitHub.com/repos/udienz/ci-rnd/statuses/$GIT_COMMIT" \
                    -H "Content-Type: application/json" \
                    -H "Authorization: token $GITHUB_TOKEN" \
                    -H "Accept: application/vnd.github+json" \
                    -X POST \
                    -d "{\"state\": \"success\",\"context\": \"continuous-integration/jenkins\", \"description\": \"Jenkins\"}"
                '''
        }
    }
    unsuccessful {
        withCredentials([string(credentialsId: 'bde8f904-5da4-459b-b8c6-844281315ff7', variable: 'GITHUB_TOKEN')]) {
              sh '''
                  curl "https://api.GitHub.com/repos/udienz/ci-rnd/statuses/$GIT_COMMIT" \
                    -H "Content-Type: application/json" \
                    -H "Authorization: token $GITHUB_TOKEN" \
                    -H "Accept: application/vnd.github+json" \
                    -X POST \
                    -d "{\"state\": \"failure\",\"context\": \"continuous-integration/jenkins\", \"description\": \"Jenkins\"}"
                '''
        }
    }
    //always {
    //    deleteDir()
    //}

  } // eol post
}
