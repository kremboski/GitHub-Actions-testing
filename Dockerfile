FROM golang:latest AS builder
WORKDIR $GOPATH/src/hello
COPY . .

RUN go build -o /usr/bin/hello 

FROM scratch 
COPY --from=builder /usr/bin/hello /usr/bin/hello 
ENTRYPOINT ["/usr/bin/hello"]