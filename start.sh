#!/bin/sh

git pull

mvn clean install

echo "restart application"

ps -ef | grep eureka | grep -v grep | awk '{print $2}' | xargs kill -9

nohup java -jar -Dspring.application.name=eureka -Dspring.profiles.active=dev target/eureka-0.0.1-SNAPSHOT.jar &