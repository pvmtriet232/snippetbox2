FROM golang:1.20-alpine as base


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

# To bind to a TCP port, runtime parameters must be supplied to the docker command.
# But we can (optionally) document in the Dockerfile what ports
# the application is going to listen on by default.
# https://docs.docker.com/engine/reference/builder/#expose

# Run
EXPOSE 4000
CMD [ "/snippetbox2" ]
# FROM alpine:latest as final
# COPY --from=built /app /app
# CMD [ "/snippetbox2" ]
