#!/bin/bash

. tests/smoke_test.sh

TIME_OUT=300
TIME_OUT_COUNT=0
PULUMI_STACK="k8s"
PULUMI_CWD="pulumi/gcp/gke/"
SMOKE_IP=$(pulumi stack --stack $PULUMI_STACK --cwd $PULUMI_CWD output app_endpoint_ip)
SMOKE_URL="http://$SMOKE_IP"

while true
do
  STATUS=$(curl -s -o /dev/null -w '%{http_code}' $SMOKE_URL)
  if [ $STATUS -eq 200 ]; then
    smoke_url_ok $SMOKE_URL
    smoke_assert_body "Welcome to CI/CD"
    smoke_assert_body "Version Number:"
    smoke_report
    echo "\n\n"
    echo 'Smoke Tests Successfully Completed.'
    echo 'Terminating the Kubernetes Cluster in 300 second...'
    sleep 300
    pulumi destroy --stack $PULUMI_STACK --cwd $PULUMI_CWD --yes
    break
  elif [[ $TIME_OUT_COUNT -gt $TIME_OUT ]]; then
    echo "Process has Timed out! Elapsed Timeout Count.. $TIME_OUT_COUNT"
    pulumi destroy --stack $PULUMI_STACK --cwd $PULUMI_CWD --yes
    exit 1
  else
    echo "Checking Status on host $SMOKE... $TIME_OUT_COUNT seconds elapsed"
    TIME_OUT_COUNT=$((TIME_OUT_COUNT+10))
  fi
  sleep 10
done
