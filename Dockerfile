FROM golang:1.20-alpine as built


# Set destination for COPY
WORKDIR /app

# Download Go modules
COPY go.mod ./
COPY go.sum ./
RUN go mod download




# Copy the source code. Note the slash at the end, as explained in
# https://docs.docker.com/engine/reference/builder/#copy
COPY cmd/web/ ./

# Build
RUN CGO_ENABLED=0 GOOS=linux go build -o /snippetbox2

FROM alpine:latest
COPY --from=built /app /app
CMD [ "/snippetbox2" ]



