FROM alpine:latest

# Install packages
RUN apk add --no-cache \
    zsh \
    git \
    curl \
    jq \
    netcat-openbsd \
    shadow # for chsh, which allows shell change

# Install Oh My Zsh (as root)
RUN ZSH="/root/.oh-my-zsh" && sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Copy your custom .zshrc
COPY .zshrc /root/.zshrc

# Set zsh as default shell for root
RUN sed -i 's|/bin/sh|/bin/zsh|' /etc/passwd

# Entry into zsh
ENTRYPOINT ["/bin/zsh"]
