#!/bin/bash


curl "https://api.GitHub.com/repos/udienz/ci-rnd/statuses/$GIT_COMMIT" \
              -H "Content-Type: application/json" \
              -H "Authorization: token $GITHUB_TOKEN" \
              -H "Accept: application/vnd.github+json" \
              -X POST \
              -d "{\"state\": \"pending\",\"context\": \"continuous-integration/jenkins\", \"description\": \"Jenkins\", \"target_url\": \"$BUILD_URL\"}"
