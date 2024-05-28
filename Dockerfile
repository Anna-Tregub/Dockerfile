FROM golang:1.22

WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY *.go ./

RUN CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -o /final

EXPOSE 8080

CMD ["/final"]