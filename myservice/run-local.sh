#!/bin/bash

mvn spring-boot:run -Dspring-boot.run.arguments="--EUREKA_URI=http://localhost --EUREKA_PORT=8761 --SERVER_PORT=8081"
