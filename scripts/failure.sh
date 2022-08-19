#!/bin/bash


curl "https://api.GitHub.com/repos/udienz/ci-rnd/statuses/$GIT_COMMIT" \
              -H "Content-Type: application/json" \
              -H "Authorization: $GITHUB_TOKEN" \
              -X POST \
              -d "{\"state\": \"failure\",\"context\": \"continuous-integration/jenkins\", \"description\": \"Jenkins\", \"target_url\": \"$JENKINS_URL/job/<JenkinsProjectName>/$BUILD_NUMBER/console\"}"
