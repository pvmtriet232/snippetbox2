FROM golang:1.20-alpine as built


WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY . .

RUN CGO_ENABLED=0 GOOS=linux go build ./cmd/web 


FROM alpine:latest as final
WORKDIR /app

COPY --from=built /app/web .
CMD [ "./web" ]
