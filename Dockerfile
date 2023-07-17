ARG PKG=github.com/Tuanm/myip

FROM golang:1.19-alpine
WORKDIR /go/src/$PKG/
COPY go.mod .
COPY main.go .
RUN go install && go build -o myip-server .

FROM alpine:latest
WORKDIR /root/
RUN apk --no-cache add curl
COPY --from=0 /go/src/$PKG/myip-server .
CMD ["./myip-server"]