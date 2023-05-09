#!/bin/bash


if [[ "$CIRCLE_REPOSITORY_URL" == *"github.com"* ]]; then
  VCS="github"
elif [[ "$CIRCLE_REPOSITORY_URL" == *"bitbucket.org"* ]]; then
  VCS="bitbucket"
else
  VCS="gitlab"
fi

echo " TOKEN: ' ${TOKEN}"
echo " VCS:' ${VCS}"

curl --location --request POST "https://events.stg.cto.ai" \
  --header "`echo 'Authorization: Bearer' ${TOKEN}`"\
  --header "x-ops-mechanism: circle-ci-${VCS}"\
  --header 'Content-Type: application/json'\
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