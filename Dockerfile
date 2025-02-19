FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    curl \
    git \
    fish \
    ripgrep \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3-dev \
    python3-pip \
    unzip \
    && rm -rf /var/lib/apt/lists/*

RUN curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz \
    && tar xzf nvim-linux-x86_64.tar.gz \
    && mv nvim-linux-x86_64 /usr/local/nvim \
    && ln -s /usr/local/nvim/bin/nvim /usr/local/bin/nvim \
    && rm nvim-linux-x86_64.tar.gz

ENV NVM_DIR=/usr/local/nvm
RUN mkdir -p $NVM_DIR \
    && curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash \
    && chmod -R 777 $NVM_DIR

ENV NODE_VERSION=18.0.0
RUN /bin/bash -c "source $NVM_DIR/nvm.sh && nvm install $NODE_VERSION && nvm use $NODE_VERSION"

ENV PATH=$NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm install -g tree-sitter-cli typescript

ENV SHELL=/usr/bin/fish

RUN mkdir -p /root/.config/nvim

WORKDIR /root/.config/nvim

RUN mkdir -p /root/cristian-linux/vaults

COPY . .

CMD ["fish"]
