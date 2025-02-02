FROM golang:alpine as builder
RUN apk add build-base
COPY . /code
WORKDIR /code

RUN go mod init github.com/pinky216/jenkins-pipeline-tutorial
# Run unit tests
RUN go test

# Build app
RUN go build -o sample-app

FROM alpine

COPY --from=builder /code/sample-app /sample-app
CMD /sample-app
