#!/bin/bash

set -x

curl "https://api.GitHub.com/repos/${REPOS}/statuses/$GIT_COMMIT" \
              -H "Content-Type: application/json" \
              -H "Accept: application/vnd.github+json" \
              -H "Authorization: token $GITHUB_TOKEN" \
              -X POST \
              -d "{\"state\": \"success\",\"context\": \"continuous-integration/jenkins\", \"description\": \"Jenkins\"}"
