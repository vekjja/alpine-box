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
    bash

# Install Oh My Zsh (in unattended mode)
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Oh My Posh using bash
RUN curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin

# Remove bash to shrink image
# RUN apk del bash

# Create theme directory and copy custom theme
RUN mkdir -p /etc/ohmyposh-themes
COPY kev.omp.json /etc/ohmyposh-themes/kev.omp.json

# Copy custom .zshrc
COPY .zshrc /root/.zshrc

# Set zsh as the default shell for root
RUN sed -i 's|/bin/sh|/bin/zsh|' /etc/passwd

# Default to Zsh shell
ENTRYPOINT ["/bin/zsh"]
