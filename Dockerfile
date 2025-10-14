FROM ubuntu:24.04

# Update image
RUN apt-get update && apt-get upgrade -y

# Install dependencies
RUN apt-get install -y \
    libfile-type-perl \
    libterm-progressbar-perl \
    perlmagick \
    libimage-exiftool-perl 

# Install locales and generate en_US.UTF-8
RUN apt-get install -y \
    locales \
    && locale-gen en_US.UTF-8 \
    && update-locale LANG=en_US.UTF-8 \
    && rm -rf /var/lib/apt/lists/*

# Set locale environment variables
ENV LANG=en_US.UTF-8 \
    LANGUAGE=en_US:en \
    LC_ALL=en_US.UTF-8
