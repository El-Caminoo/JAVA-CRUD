FROM gradle:latest
WORKDIR /app
COPY . /app
RUN gradle build
CMD [ "./gradlew", "bootRun" ]

