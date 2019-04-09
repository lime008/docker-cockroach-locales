FROM cockroachdb/cockroach:v2.1.6

RUN apt-get install -y locales-all && \
	rm -rf /var/lib/apt/lists/*
