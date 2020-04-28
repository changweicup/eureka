#!/bin/sh

git pull

mvn clean install

echo "restart application"

ps -ef | grep myboot | grep -v grep | awk '{print $2}' | xargs kill -9

nohup java -jar -Dspring.application.name=myboot -Dspring.profiles.active=dev target/eureka-0.0.1-SNAPSHOT &