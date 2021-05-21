FROM alpine:latest

ARG COCEXT='coc-sh \
    coc-vimlsp \
    coc-tsserver \
    coc-snippets \
    coc-docker \
    coc-marketplace \
    coc-explorer \
    coc-emoji \
    coc-diagnostic \
    coc-clangd \
    coc-css \
    coc-html \
    coc-highlight \
    coc-prettier \
    coc-markdownlint \
    coc-json \
    coc-yaml'

ARG VSPECGADGETS='--enable-c --enable-python --force-enable-node --enable-bash'

RUN apk update && apk add -U --no-cache \
    build-base \
    abuild \
    autoconf \
    automake \
    cmake \
    unzip \
    git \
    zsh \
    gettext-tiny-dev \
    openssh-client \
    libtool \
    libintl \
    libluv \
    libtermkey \
    libuv \
    libvterm \
    luajit \
    msgpack-c \
    unibilium \
    bash \
    ncurses \
    less \
    docker \
    python3-dev \
    ipython \
    py-pip \
    tmux \
    su-exec \
    ripgrep \
    fzf \
    exa \
    nodejs \
    npm \
    ctags \
    clang-extra-tools \
    # shellcheck \
    fd \
    bat

# Set Timezone
RUN apk add tzdata && \
    cp /usr/share/zoneinfo/Europe/Oslo /etc/localtime && \
    echo "Europe/Oslo" > /etc/timezone && \
    apk del tzdata

ENV HOME /home/me

# Configure text editor - vim!
RUN \
    git clone https://github.com/neovim/neovim.git nvim && \
    cd nvim && \
    make && make install && \
    cd ../ && rm -rf nvim
# Installing vim-plug
RUN curl -fLo ${HOME}/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
# Installing needed plugins
RUN npm install -g neovim
RUN pip3 install neovim
# Code minimap
RUN wget https://github.com/wfxr/code-minimap/releases/download/v0.6.0/code-minimap-v0.6.0-x86_64-unknown-linux-musl.tar.gz
RUN tar -zxvf code-minimap-*.tar.gz
RUN mv code-minimap-*/code-minimap /usr/bin/
RUN rm -rf code-minimap-*
# Copy neovim configuration
COPY neovim/lua/* ${HOME}/.config/nvim/lua/
COPY neovim/plugin/* ${HOME}/.config/nvim/plugin/
COPY vimrc ${HOME}/.config/nvim/init.vim
COPY coc-settings.json ${HOME}/.config/nvim/coc-settings.json
# Installing plugins
RUN nvim -es -u ${HOME}/.config/nvim/init.vim -i NONE -c "PlugInstall" -c "qa" || exit 0
# Coc.nvim
RUN nvim -c "CocInstall -sync ${COCEXT}|qa"
# Vimspector
RUN /home/me/.config/nvim/plugged/vimspector/install_gadget.py ${VSPECGADGETS}

# In the entrypoint, we'll create a user called `me`
WORKDIR ${HOME}

# Setup my $SHELL
ENV SHELL /bin/zsh
# Install oh-my-zsh
RUN wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O - | zsh || true
# Copy ZSh config
COPY zshrc ${HOME}/.zshrc

# Install ZSH plugins
RUN git clone https://github.com/zdharma/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
RUN git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install TMUX
ENV TMUX_PLUGIN_MANAGER_PATH ${HOME}/.tmux/plugins
COPY tmuxrc ${HOME}/.tmux.conf
# COPY defaulttmuxsession.yaml ${HOME}/defaulttmuxsession.yaml
# RUN pip3 install --user tmuxp
RUN git clone https://github.com/tmux-plugins/tpm ${HOME}/.tmux/plugins/tpm && \
    ${HOME}/.tmux/plugins/tpm/bin/install_plugins

# Copy git config over
COPY gitconfig ${HOME}/.gitconfig
COPY profile ${HOME}/.profile
COPY README.md ${HOME}/README.md

# Entrypoint script creates a user called `me` and `chown`s everything
COPY entrypoint.sh /bin/entrypoint.sh
RUN chmod +x /bin/entrypoint.sh

# Copy over the useful scripts
COPY scripts/* /usr/local/bin/
RUN chmod -R +x /usr/local/bin

# Set working directory to /workspace
# WORKDIR /workspace

# Default entrypoint, can be overridden
ENV LANG en_US.UTF-8
ENV LC_COLLATE C
CMD ["/bin/entrypoint.sh"]
