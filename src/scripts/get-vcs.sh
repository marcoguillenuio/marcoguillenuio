#!/bin/bash
if [[ "$CIRCLE_REPOSITORY_URL" == *"github.com"* ]]; then
  VCS="github"
elif [[ "$CIRCLE_REPOSITORY_URL" == *"bitbucket.org"* ]]; then
  VCS="bitbucket"
else
  VCS="gitlab"
fi
echo "VCS: $VCS"