FROM alpine
# LABEL Maintainer="panda0001@gmail.com"
# Set environment variables.
# 指定環境變數 
# 指定一個環境變數，會被後續 RUN 指令使用，並在容器運行時保持。
# ENV <key> <value>
ENV MYVAR=TEST-VAR-EORK
# Install packages.
RUN apk update
# install rc-service (alpine service manager)
# RUN apk add openrc --no-cache
# install bash and some util
RUN apk add --no-cache bash bash-doc bash-completion busybox-extras coreutils curl wget
# COPY  *.txt /root/
# 指定開放Port
# EXPOSE 80
# Set the default command. # 建立新容器時要執行的指令
CMD ["/bin/sh"]

