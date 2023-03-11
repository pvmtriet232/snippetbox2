FROM golang:1.20-alpine as base

WORKDIR /app

COPY go.mod ./

RUN go mod download 

COPY *.go ./

RUN go build -o /snippetbox2

CMD ["/snippetbox2"]


