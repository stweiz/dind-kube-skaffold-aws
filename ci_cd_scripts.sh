#!/bin/sh

# A collection of helper functions used in pipeline jobs
# Make sure docker container is up and running before executing any commands
# https://gitlab.com/gitlab-org/gitlab-runner/-/issues/1986#note_549888956
function wait_for_docker() {
  attempts=30
  echo "---- Waiting $attempts sec for docker to come up ----"
  while ! docker info > /dev/null 2>&1; do
      echo "Connection attempts left: $attempts"
      if [ $attempts -eq 0 ]; then
          echo "Couldn't connect to docker, no attempts left"
          return 1
      fi;
      let attempts=$attempts-1
      echo "Connection to docker failed"
      sleep 1
  done
  echo "---- Docker came up ----"
  docker login -u gitlab-ci-token -p $CI_JOB_TOKEN $CI_REGISTRY
}
