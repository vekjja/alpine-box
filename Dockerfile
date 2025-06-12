FROM alpine:latest

# Install essential packages, including bash temporarily
RUN apk add --no-cache \
    zsh \
    git \
    curl \
    jq \
    netcat-openbsd \
    shadow \
    unzip \
    bash &&

    # Install Oh My Zsh
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended &&

    # Install Oh My Posh using bash
    curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin &&

    # Remove bash to reduce image size
    apk del bash

# Create theme directory and copy your custom theme
RUN mkdir -p /etc/ohmyposh-themes
COPY kev.omp.json /etc/ohmyposh-themes/kev.omp.json

# Copy your .zshrc
COPY .zshrc /root/.zshrc

# Set zsh as the default shell
RUN sed -i 's|/bin/sh|/bin/zsh|' /etc/passwd

ENTRYPOINT ["/bin/zsh"]
