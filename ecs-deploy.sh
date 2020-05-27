#!/bin/bash

#Script to get current task definition, and based on that add new ecr image address to old template and remove attributes that are not needed, then we send new task definition, get new revision number from output and update service
set -e
ECR_IMAGE="139813996202.dkr.ecr.ap-southeast-2.amazonaws.com/$1:$2"
TASK_DEFINITION=$(aws ecs describe-task-definition --task-definition dev-$1 --region ap-southeast-2)
NEW_TASK_DEFINTIION=$(echo $TASK_DEFINITION | jq --arg IMAGE "$ECR_IMAGE" '.taskDefinition | .containerDefinitions[0].image = $IMAGE | del(.taskDefinitionArn) | del(.revision) | del(.status) | del(.requiresAttributes) | del(.compatibilities)')
NEW_TASK_INFO=$(aws ecs register-task-definition --region ap-southeast-2 --cli-input-json "$NEW_TASK_DEFINTIION")
NEW_REVISION=$(echo $NEW_TASK_INFO | jq '.taskDefinition.revision')
aws ecs update-service --cluster dev-cluster --service dev-$1 --task-definition dev-$1:${NEW_REVISION} --region ap-southeast-2