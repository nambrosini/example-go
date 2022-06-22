FROM golang:1.16 as build
WORKDIR /go/src/github.com/nambrosini/example-go
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest  
RUN apk --no-cache add ca-certificates
WORKDIR /root/
COPY --from=build /go/src/github.com/nambrosini/example-go/app ./
CMD ["./app"]  