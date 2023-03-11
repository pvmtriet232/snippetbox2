FROM golang:1.20-alpine as base

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download 

COPY *.go ./

RUN go build -o /snippetbox2

CMD ["/snippetbox2"]


