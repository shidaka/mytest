FROM openjdk:10

ADD target/myservice-0.0.1-SNAPSHOT.jar /myservice.jar

ENTRYPOINT exec java $JAVA_OPTS -jar myservice.jar

CMD ['run']