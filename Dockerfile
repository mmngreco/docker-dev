FROM docker-base:0.2.0-allpython-debian


ENV TERM="xterm-256color"
ENV DOTFILES="/root/github/mmngreco/dotfiles"
ENV PYTHON_NEOVIM="/root/.envs/neovim/bin/python"

RUN echo -e "\n\n ============ install dotfiles ============ \n\n"
RUN git clone --recurse-submodules https://github.com/mmngreco/dotfiles $DOTFILES \
    && $DOTFILES/install \
    && python3.7 -m pip install virtualenv setuptools pip wheel -U \
    && python3.7 -m virtualenv ~/.envs/neovim/ \
    && echo "export PYTHON_NEOVIM=$PYTHON_NEOVIM" >> $DOTFILES/shell/variables \
    && $PYTHON_NEOVIM -m pip install notedown pynvim \
    && $DOTFILES/software/tmux_plugins.sh \
    && apt update \
    && apt install -y hub zsh fzf ack silversearcher-ag ruby-full \
    && gem install tmuxinator -v 1.1.5 \
    # install lab
    && bash -c "$(curl -s https://raw.githubusercontent.com/zaquestion/lab/master/install.sh)" \
    # oh-my-zsh
    && bash -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" \
    && chsh -s $(which zsh) $USERNAME

