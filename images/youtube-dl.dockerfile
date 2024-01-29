FROM debian:buster-slim
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y --no-install-recommends \
    wget \
    ca-certificates \
    && apt-get clean && rm -rf /var/lib/apt/lists/*
RUN update-ca-certificates
RUN wget https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp_linux -O youtube-dl && \
  chmod +x youtube-dl && \
  mv youtube-dl /usr/local/bin
