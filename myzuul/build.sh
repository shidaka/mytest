#!/bin/bash
mvn clean package
docker build -t myzuul .
docker image ls | grep myzuul
