FROM alpine:3.8

# When this Dockerfile was last refreshed (year/month/day)
ENV REFRESHED_AT 2018-07-25
ENV OAUTH2_PROXY_VERSION 2.2

# Checkout bitly's latest google-auth-proxy code from Github
ADD https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz /tmp
RUN tar -xf /tmp/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz -C ./bin --strip-components=1 && rm /tmp/*.tar.gz

# Install CA certificates
RUN apk add --no-cache --virtual=build-dependencies ca-certificates

# Expose the ports we need and setup the ENTRYPOINT w/ the default argument
# to be pass in.
EXPOSE 8080 4180
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]