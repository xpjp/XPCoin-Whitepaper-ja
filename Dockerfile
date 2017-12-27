FROM ubuntu:xenial

# Change APT source
RUN \
  sed -i".bak" \
    "s@http://archive\.ubuntu\.com@http://ftp\.riken\.go\.jp/Linux/ubuntu@" \
    /etc/apt/sources.list

# Set timezone to Japan(utf-8), and update APT packages
RUN \
  useradd -s /bin/bash -m latexuser && \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    apt-utils && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    language-pack-ja language-pack-en tzdata software-properties-common && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* && \
  update-locale LANG=ja_JP.UTF-8

# Install texlive, pandoc, imagemagick etc...
RUN \
  apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y \
    vim \
    texlive texlive-lang-cjk \
    # texlive-fonts-recommended \
    # texlive-fonts-extra \
    xdvik-ja \
    imagemagick \
    pandoc \
    make && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*

WORKDIR /root
