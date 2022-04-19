FROM golang:latest

RUN mkdir /app
WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download

COPY *.go ./

ENV INTERN_WEBSERVER_PORT 8080
ENV INTERN_PROMETHEUS_PORT  8080
ENV INTERN_LOG_LEVEL  INFO

RUN go build -o ./main

EXPOSE 8080
CMD ["./main"]

#ENTRYPOINT ["/build/Infrastructure/main"]