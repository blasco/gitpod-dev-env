FROM gitpod/workspace-full:latest

# Disable questions from some packages during installation
ENV DEBIAN_FRONTEND="noninteractive" 

SHELL ["/bin/bash", "-c"]

# Upgrade and install essential packages
RUN sudo apt-get update && \
    sudo apt-get upgrade -y && \
    sudo apt-get install -y \ 
        git \
        curl \
        wget \
        openssh-server

# Dotfiles
ADD "https://www.random.org/cgi-bin/randbyte?nbytes=10&format=h" skipcache
RUN mkdir -p /home/gitpod/dotfiles && \
    git clone https://github.com/blasco/dotfiles /home/gitpod/dotfiles && \
    cd /home/gitpod/dotfiles && \
    git submodule update --recursive --init

# Nvim
COPY install_nvim.sh /home/gitpod/install_nvim.sh
RUN sudo chmod a+x ~/install_nvim.sh
    # ~/install_nvim.sh
    # rm /home/gitpod/install_nvim.sh

# # Zsh shell
# COPY install_zsh.sh /home/gitpod/install_zsh.sh
# RUN sudo chmod a+x ~/install_zsh.sh && \
#     ~/install_zsh.sh && \
#     rm ~/install_zsh.sh

# Autojump
RUN sudo apt-get install -y autojump

# FZF for fuzzy command search
RUN git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && \
    ~/.fzf/install
