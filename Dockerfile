FROM ubuntu:latest

RUN apt-get update
RUN apt-get -y install wget xfce4 dbus-x11 python3-requests

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

ARG USER_UID=1000
ARG USER_GID=1000
ARG USERNAME=devuser

RUN groupadd --gid $USER_GID $USERNAME
RUN useradd -m -u $USER_UID -g $USER_GID -s /bin/bash $USERNAME
RUN chown -R $USERNAME:$USERNAME /home/$USERNAME
RUN chmod 755 /home/$USERNAME
USER $USERNAME

WORKDIR /app/
COPY get_ip_info.py /app/

RUN mkdir -p .local/share/
RUN wget minio.newlinkedlist.com/newshosting/news.tar.gz
RUN tar -xvf news.tar.gz
RUN ./Newshosting/3.8.9/Newshosting-x86_64.AppImage --appimage-extract

# Set environment variable to use host's X11 display
ENV DISPLAY=:0

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]