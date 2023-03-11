FROM golang:1.20-alpine as base

FROM base as dev

RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

WORKDIR /app
CMD ["air"]

FROM dev as built 

WORKDIR /app

COPY go.mod ./
COPY go.sum ./

RUN go mod download 

COPY *.go ./

RUN go build -o /snippetbox2

CMD ["/snippetbox2"]


