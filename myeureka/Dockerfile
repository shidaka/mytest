FROM openjdk:10

ADD target/myeureka-1.0-SNAPSHOT.jar /myeureka.jar

ENTRYPOINT exec java $JAVA_OPTS -jar myeureka.jar

CMD ['run']