#!/bin/bash
echo " TOKEN: ' ${TOKEN}"

curl --location --request POST "https://events.stg.cto.ai" \
  --header "Authorization: Bearer ${TOKEN}"\
  --header "x-ops-mechanism: circle-ci"\
  --header "Content-Type: application/json"\
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
    \"vcs_type\":\"${VCS_TYPE}\",
}"