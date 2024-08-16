# Create build stage based on buster image
FROM golang:1.20-buster AS builder


#build-arg
ARG BRANCH
ARG PORT
# ARG PROJ_NAME

# Create working directory under /app
WORKDIR /app

# Copy over all go config (go.mod, go.sum etc.)
COPY go.* ./

# Install any required modules
RUN go mod download

# Copy over Go source code
COPY *.go ./
# COPY . .

# Install dependencies
RUN go get -u github.com/joho/godotenv

# Copy ENV
COPY .env.${BRANCH} .env

# Run the Go build and output binary under hello_go_http
RUN go build -o /hello_go_http

# Make sure to expose the port the HTTP server is using
EXPOSE ${PORT}

# Run the app binary when we run the container
ENTRYPOINT ["/hello_go_http"]














# # Golang base image
# FROM golang:latest

# #ARG BRANCH
# ARG PORT
# #ARG PROJ_NAME

# # Set the working directory inside the container
# WORKDIR /app

# # Copy the Go application files to the container
# COPY . .

# # Install dependencies
# RUN go get -u github.com/joho/godotenv

# # Build the Go application
# RUN go build -o main .

# # Expose the port the application runs on
# EXPOSE ${PORT}

# # Command to run the application
# CMD ["./main"]