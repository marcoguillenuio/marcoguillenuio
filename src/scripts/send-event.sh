#!/bin/bash


if [[ "$CIRCLE_REPOSITORY_URL" == *"github.com"* ]]; then
  VCS="github"
elif [[ "$CIRCLE_REPOSITORY_URL" == *"bitbucket.org"* ]]; then
  VCS="bitbucket"
else
  VCS="gitlab"
fi
echo "VCS: $VCS"

echo "111 TOKEN' ${TOKEN}"
echo "222 VCS' ${VCS}"

curl --location --request POST "https://events.stg.cto.ai" \
  --header "`echo 'Authorization: Bearer' ${TOKEN}`"\
  --header 'Content-Type: application/json'\
  --header "x-ops-mechanism: circle-ci-${VCS}"\
  --data "{
    \"repo\":\"${REPO}\",
    \"branch\":\"${BRANCH}\",
    \"commit\":\"${COMMIT}\",
    \"image\":\"${IMAGE}\",
    \"environment\":\"${ENVIRONMENT}\",
    \"event_name\":\"${EVENT_NAME}\",
    \"event_action\":\"${EVENT_ACTION}\",
    \"team_id\":\"${TEAM_ID}\",
    \"meta\":{ \"user\":\"${USER}\", \"origin\":\"${ORIGIN}\" }
}"