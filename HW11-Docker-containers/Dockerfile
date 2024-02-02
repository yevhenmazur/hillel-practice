FROM golang:alpine AS build

# gcc/g++ are required to build SASS libraries for extended version
RUN apk add --update --no-cache \
      gcc \
      g++ \
      musl-dev \
      git

# build and install hugo
RUN go install -tags standard github.com/gohugoio/hugo@latest

# ------ Stage 2 ------

FROM alpine:latest

# Install runtime
RUN apk add --update --no-cache \
      ca-certificates \
      tzdata \
      git \
      go && \
    update-ca-certificates && \
    # clean up
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

# create user for run hugo-server
RUN addgroup -S -g 1024 hugo && adduser -G hugo -S -D -H hugo-server
USER hugo-server

# bring over binary from build stage
COPY --from=build /go/bin/hugo /usr/bin/hugo

# add site source as volume
VOLUME /src
WORKDIR /src

# expose live-refresh server on default port
EXPOSE 1313

ENTRYPOINT ["hugo"]
#CMD ["server", "--bind", " 0.0.0.0"]
