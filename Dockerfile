FROM ruby:2.6

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# This Dockerfile adds a non-root user with sudo access. Use the "remoteUser"
# property in devcontainer.json to use it. On Linux, the container user's GID/UIDs
# will be updated to match your local UID/GID (when using the dockerFile property).
# See https://aka.ms/vscode-remote/containers/non-root-user for details.
ARG USERNAME=vscode
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Configure apt and install packages
RUN apt-get update \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1 \
    #
    # Install vim, git, process tools, lsb-release
    && apt-get install -y \
        vim \
        git \
        openssh-client \
        less \
        iproute2 \
        procps \
        lsb-release \
        postgresql-client \
    #
    # Install ruby
    && apt-get install -y \
        ruby \
        ruby-dev \
        build-essential \
        libsqlite3-dev \
        zlib1g-dev \
        libxml2 \
    #
    # Install nodejs
    && apt-get install -y nodejs \
    # 
    # Install yarn
    && apt-get install -y curl apt-transport-https lsb-release \
    && curl -sS https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/pubkey.gpg | apt-key add - 2>/dev/null \
    && echo "deb https://dl.yarnpkg.com/$(lsb_release -is | tr '[:upper:]' '[:lower:]')/ stable main" | tee /etc/apt/sources.list.d/yarn.list \
    && apt-get update \
    && apt-get -y install --no-install-recommends yarn \
    #
    # Install debug tools
    && gem install \
        rake \
        ruby-debug-ide \
        debase \
    #
    # Install sinatra MVC components
    && gem install \
        rails \
        webdrivers \
    #
    # Create a non-root user to use if preferred - see https://aka.ms/vscode-remote/containers/non-root-user.
    && groupadd --gid $USER_GID $USERNAME \
    && useradd -s /bin/bash --uid $USER_UID --gid $USER_GID -m $USERNAME \
    # [Optional] Add sudo support for the non-root user
    && apt-get install -y sudo \
    && echo $USERNAME ALL=\(root\) NOPASSWD:ALL > /etc/sudoers.d/$USERNAME\
    && chmod 0440 /etc/sudoers.d/$USERNAME \
    #
    # Clean up
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*
RUN gem install bundler
WORKDIR /app
# RUN bundle
# # RUN mkdir /workspaces
# # RUN mkdir /workspaces/cw2


COPY Gemfile .
COPY Gemfile.lock .
RUN bundle

COPY package.json yarn.lock ./
RUN yarn install

# Switch back to dialog for any ad-hoc use of apt-get
ENV DEBIAN_FRONTEND=dialog


# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# RUN mkdir /myapp
# WORKDIR /myapp
# COPY Gemfile /myapp/Gemfile
# COPY Gemfile.lock /myapp/Gemfile.lock
# RUN bundle install
# COPY . /myapp

# # Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT "/app/bin/entrypoint.sh"
# EXPOSE 3000

# # Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]