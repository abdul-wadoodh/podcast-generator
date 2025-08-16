FROM ubuntu:latest

# stop tzdata from asking questions during apt install
ENV DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC

RUN apt-get update && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    python3-yaml \ 
    git \
    tzdata \
 && rm -rf /var/lib/apt/lists/*

# your app files
COPY feed.py /usr/local/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

# make scripts executable
RUN chmod +x /usr/local/bin/feed.py /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
