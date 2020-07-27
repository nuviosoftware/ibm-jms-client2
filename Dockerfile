FROM openjdk:8-jdk-alpine
EXPOSE 9090
WORKDIR /app
COPY target/payment-service-0.0.1-SNAPSHOT.jar /app/payment-service-0.0.1-SNAPSHOT.jar
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
RUN chmod +x /wait

ENTRYPOINT /wait && exec java $JVM_OPTIONS -XX:+UnlockExperimentalVMOptions -XX:+UseCGroupMemoryLimitForHeap -XX:MaxRAMFraction=2 -jar -Djava.awt.headless=true  payment-service-0.0.1-SNAPSHOT.jar