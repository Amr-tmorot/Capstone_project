#!/usr/bin/env bash
docker login -u $DOCKER_USER -p $DOCKER_PASS 
docker tag capstone:latest tmorot/capstone:latest
docker push tmorot/capstone:latest