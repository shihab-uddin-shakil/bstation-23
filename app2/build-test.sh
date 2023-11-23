#!/bin/bash
set -ex

PROJECT_ROOT=/home/shihab/Documents/jenkins-workspace/brain-23-app2/task1/app2

#scan code
sonar-scanner \
  -Dsonar.projectKey=app2 \
  -Dsonar.sources=./src \
  -Dsonar.host.url=http://localhost:9000 \
  -Dsonar.token=sqp_dcf6ce44c5c0d3232cf82194a85d1fe742b5aa31

# Build docker app2 image
cd $PROJECT_ROOT
docker build . -t app2 -f ./build/Dockerfile

# Create docker image random tag number
IMAGE_TAG=$((1 + RANDOM % 1000))

#scan image
trivy image app2


#tag docker image
docker tag app2  shihab24/app2:$IMAGE_TAG

#tag docker image
docker push shihab24/app2:$IMAGE_TAG

#update k8s image tag

sed "s|{{IMAGE_TAG}}|${IMAGE_TAG}|g" ./deploy/template/deployment.yml.temp  >  ./deploy/deployment.yml
