FROM alpine:latest
ARG  release=v1.24.0
RUN  wget -O /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$release/bin/linux/amd64/kubectl
RUN  chmod +x /usr/local/bin/kubectl

FROM alpine:latest
RUN  apk add --no-cache runit
COPY --from=0 /usr/local/bin/kubectl /usr/local/bin/
COPY entrypoint /entrypoint
ENTRYPOINT ["/entrypoint"]
CMD  ["proxy"]
