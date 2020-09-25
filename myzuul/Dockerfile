FROM openjdk:10

ADD target/myzuul-0.0.1-SNAPSHOT.jar /myzuul.jar

ENTRYPOINT exec java $JAVA_OPTS -jar myzuul.jar

CMD ['run']