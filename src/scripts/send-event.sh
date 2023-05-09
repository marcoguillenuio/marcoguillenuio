#!/bin/bash
curl --location --request POST "https://events.stg.cto.ai" \
  --header "`echo 'Authorization: Bearer' <<parameters.token>>`"\
  --header 'Content-Type: application/json'\
  --header "x-ops-mechanism: circle-ci-${VCS}"\
  --data "{
    \"repo\":\"<<parameters.repo>>\",
    \"branch\":\"<<parameters.branch>>\",
    \"commit\":\"<<parameters.commit>>\",
    \"image\":\"<<parameters.image>>\",
    \"environment\":\"<<parameters.environment>>\",
    \"event_name\":\"<<parameters.event_name>>\",
    \"event_action\":\"<<parameters.event_action>>\",
    \"team_id\":\"<<parameters.team_id>>\",
    \"meta\":{ \"user\":\"<<parameters.user>>\", \"origin\":\"<<parameters.origin>>\" }
}"