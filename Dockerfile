FROM cockroachdb/cockroach:v2.1.6

FROM debian:9.8-slim

RUN apt-get update && \
	apt-get -y upgrade && \
	apt-get install -y libc6 ca-certificates tzdata locales-all && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /cockroach
COPY --from=0 /cockroach/cockroach.sh /cockroach/cockroach /cockroach/

WORKDIR /cockroach/

EXPOSE 26257 8080
ENTRYPOINT ["/cockroach/cockroach.sh"]
