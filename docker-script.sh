#!/bin/bash

AWS_REGION="ap-south-1"
ECR_REPO_URL="709087243859.dkr.ecr.${AWS_REGION}.amazonaws.com/whiteapp"

docker login --username AWS --password-stdin ${ECR_REPO_URL}
docker push ${ECR_REPO_URL}:${BUILD_NUMBER}
