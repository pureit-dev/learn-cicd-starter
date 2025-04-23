ARG TARGETPLATFORM=linux/amd64
FROM --platform=$TARGETPLATFORM debian:stable-slim

RUN apt-get update && apt-get install -y ca-certificates

ADD notely /usr/bin/notely
ADD .env /.env

# Set default PORT environment variable
ENV PORT=8080

# Expose the port
EXPOSE 8080

# Use exec form to ensure signals are passed correctly
CMD ["/usr/bin/notely"]
