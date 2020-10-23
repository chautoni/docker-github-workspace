FROM ubuntu:groovy

RUN apt-get update && apt-get upgrade -y
RUN apt-get install build-essential curl file git sudo libpq-dev -y

RUN useradd -m -s /bin/bash dev
RUN echo 'dev ALL=(ALL) NOPASSWD:ALL' >>/etc/sudoers
USER dev
RUN /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

ENV PATH="/home/linuxbrew/.linuxbrew/bin:${PATH}"
RUN brew install antibody asdf bat curl fzf gcc git ripgrep tree zsh postgresql

USER root
RUN echo $(which zsh) >> /etc/shells

USER dev
COPY * /home/dev/

RUN antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
RUN asdf plugin-add ruby https://github.com/asdf-vm/asdf-ruby.git
RUN asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
RUN bash -c '${ASDF_DATA_DIR:=$HOME/.asdf}/plugins/nodejs/bin/import-release-team-keyring'

RUN /home/linuxbrew/.linuxbrew/opt/fzf/install --all

RUN asdf install ruby 2.6.6
RUN asdf install nodejs 12.14.1
RUN asdf global ruby 2.6.6
RUN asdf global nodejs 12.14.1
