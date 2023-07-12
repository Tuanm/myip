FROM golang:1.19-alpine
WORKDIR /go/src/github.com/Tuanm/myip/
COPY go.mod .
COPY main.go .
RUN go install && go build -o myip-server .

FROM alpine:latest
WORKDIR /root/
RUN apk --no-cache add curl
COPY --from=0 /go/src/github.com/Tuanm/myip/myip-server .
CMD ["./myip-server"]