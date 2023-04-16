FROM python:3.11-slim-buster

ENV TERM="xterm-256color"
ENV DOTFILES="/root/github/mmngreco/dotfiles"

RUN apt update && apt install -f --yes git curl wget fuse
RUN python -m pip install virtualenv setuptools pip wheel -U

# dotfiles
RUN git clone https://github.com/mmngreco/dotfiles $DOTFILES && \
    cd $DOTFILES && \
    git submodule update --init dotbot
# dependencies
RUN $DOTFILES/software/nvim
RUN $DOTFILES/software/starship
RUN $DOTFILES/software/zsh
RUN $DOTFILES/software/ohmyzsh
RUN $DOTFILES/software/zsh-suggestions
RUN $DOTFILES/software/autoenv
RUN $DOTFILES/install -c $DOTFILES/ubuntu.yaml

WORKDIR /root
COPY ./entrypoint.sh /entrypoint.sh
ENTRYPOINT ["sh", "/entrypoint.sh", "zsh"]
