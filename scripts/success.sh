#!/bin/bash

curl "https://api.GitHub.com/repos/udienz/ci-rnd/statuses/$GIT_COMMIT?access_token=$GITHUB_TOKEN" \
              -H "Content-Type: application/json" \
              -X POST \
              -d "{\"state\": \"success\",\"context\": \"continuous-integration/jenkins\", \"description\": \"Jenkins\", \"target_url\": \"$JENKINS_URL/job/<JenkinsProjectName>/$BUILD_NUMBER/console\"}"
