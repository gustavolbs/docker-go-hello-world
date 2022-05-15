FROM golang:alpine AS builder

RUN apk update && apk add --no-cache git
WORKDIR $GOPATH/src/app/
COPY ./go-code .

# Build the binary.
RUN go build ./hello.go

FROM scratch
COPY --from=builder /go/src/app/hello /hello
ENTRYPOINT ["/hello"]