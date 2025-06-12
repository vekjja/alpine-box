FROM alpine:latest

# Install dependencies
RUN apk add --no-cache \
    zsh \
    git \
    curl \
    jq \
    netcat-openbsd \
    shadow \
    unzip

# Install Oh My Zsh
RUN ZSH="/root/.oh-my-zsh" && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Oh My Posh
RUN curl -s https://ohmyposh.dev/install.sh | bash -s -- -d /usr/local/bin

# Copy custom OMP theme to a shared path
COPY kev.omp.json /etc/ohmyposh-themes/kev.omp.json

# Copy custom .zshrc
COPY .zshrc /root/.zshrc

# Set zsh as the default shell
RUN sed -i 's|/bin/sh|/bin/zsh|' /etc/passwd

# Entry into Zsh
ENTRYPOINT ["/bin/zsh"]
