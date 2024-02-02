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

MAINTAINER Yevhen Mazur <yevhen.mazur@pm.me>
ARG REFRESHED_AT=0000-00-00
ARG GID=1024
ARG UID=1001

ENV SITENAME=hugo.local

# Install runtime
RUN apk add --update --no-cache \
      ca-certificates \
      tzdata \
      git \
      go && \
    update-ca-certificates && \
    # clean up
    rm -rf /tmp/* /var/tmp/* /var/cache/apk/*

# add init script
ADD --chmod=755 ./opt/bin/hugo-init.sh /opt/bin/hugo-init.sh

# create user for run hugo-server
RUN addgroup -S -g $GID hugo && adduser -G hugo -u $UID -S -D -H hugo-server
USER hugo-server

# bring over binary from build stage
COPY --from=build /go/bin/hugo /usr/bin/hugo

# add site source as volume
VOLUME /src
WORKDIR /src

# expose live-refresh server on default port
EXPOSE 1313

ENTRYPOINT ["/opt/bin/hugo-init.sh"]
#CMD ["server", "--bind", " 0.0.0.0"]
