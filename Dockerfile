# === The official alpine docker image - https://hub.docker.com/_/alpine
FROM alpine:3
LABEL Maintainer="panda0001@gmail.com"
# =  Set environment variables. Environment replacement - https://docs.docker.com/engine/reference/builder/#environment-replacement
# Environment variables are notated in the Dockerfile either with $variable_name or ${variable_name}.
# ENV <key> <value>
ENV TZ=Asia/Taipei

# = 設定工作目錄
WORKDIR /root/

# === Packages install
RUN apk update
RUN apk upgrade

#! Change TimeZone
RUN apk add --update tzdata

#! bash and some util
RUN apk add --no-cache bash bash-doc bash-completion \
    busybox-extras coreutils curl wget vim

#! rc-service (alpine service manager)
RUN apk add openrc --no-cache

#! TLS Require
# RUN apk add ca-certificates && update-ca-certificates

#! install mongodb tools
# ENV MONGO_TOOLS_VERSION=4.2
# RUN apk add --no-cache mongodb-tools

#! Clean APK cache
RUN rm -rf /var/cache/apk/*

# = Zsh One line installation- https://github.com/deluan/zsh-in-docker#oh-my-zsh-installer-for-docker
RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.1/zsh-in-docker.sh)" -- \
    -t ys \
    -a 'COMPLETION_WAITING_DOTS="true"' \
    -p colored-man-pages \
    -p compleat \
    -p extract \
    -p git \
    -p history \
    -p npm \
    -p sudo \
    -p yarn \
    -p z \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions \
    -p https://github.com/zsh-users/zsh-syntax-highlighting

#=== File Copy
# COPY  *.txt ./
#! vim color scheme and config
COPY .vim/colors/* ./.vim/colors/
COPY vimrc ./.vimrc

# = VOLUME Setup
# VOLUME /app

# = 指定開放Port
# EXPOSE 80

# = Set the default command. # 建立新容器時要執行的指令
CMD ["/bin/sh"]        