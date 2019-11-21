FROM openjdk:8-jre-slim

ENV APP_HOME=/opt/waves
WORKDIR $APP_HOME

COPY wind.custom.conf $APP_HOME/waves.conf
RUN apt-get update && apt-get install -y curl jq wget \
    && wget https://github.com/windcoinplatform/WINDnode/blob/master/wind-all-1.1.5.jar?raw=true -qO $APP_HOME/waves.jar
EXPOSE 6860 6869
ENTRYPOINT ["java", "-jar", "waves.jar", "waves.conf"]
