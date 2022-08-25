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
                          sh '''#!/bin/bash
                          curl "https://api.GitHub.com/repos/udienz/ci-rnd/statuses/$GIT_COMMIT" \
                            -H "Content-Type: application/json" \
                            -H "Authorization: token $GITHUB_TOKEN" \
                            -H "Accept: application/vnd.github+json" \
                            -X POST \
                            -d "{\"state\": \"pending\",\"context\": \"continuous-integration/jenkins\", \"description\": \"Jenkins\", \"target_url\": \"$BUILD_URL\"}"
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
              sh '''#!/bin/bash
                  curl "https://api.GitHub.com/repos/udienz/ci-rnd/statuses/$GIT_COMMIT" \
                    -H "Content-Type: application/json" \
                    -H "Authorization: token $GITHUB_TOKEN" \
                    -H "Accept: application/vnd.github+json" \
                    -X POST \
                    -d "{\"state\": \"pending\",\"context\": \"continuous-integration/jenkins\", \"description\": \"Jenkins\", \"target_url\": \"$BUILD_URL\"}"
                '''
        }
    }
    unsuccessful {
        withCredentials([string(credentialsId: 'bde8f904-5da4-459b-b8c6-844281315ff7', variable: 'GITHUB_TOKEN')]) {
              sh '''#!/bin/bash
                  curl "https://api.GitHub.com/repos/udienz/ci-rnd/statuses/$GIT_COMMIT" \
                    -H "Content-Type: application/json" \
                    -H "Authorization: token $GITHUB_TOKEN" \
                    -H "Accept: application/vnd.github+json" \
                    -X POST \
                    -d "{\"state\": \"pending\",\"context\": \"continuous-integration/jenkins\", \"description\": \"Jenkins\", \"target_url\": \"$BUILD_URL\"}"
                '''
        }
    }
    //always {
    //    deleteDir()
    //}

  } // eol post
}
