FROM ubuntu:latest

RUN apt-get update
# xfce4 was an easy way to get all the deps for launching the UI
RUN apt-get -y install wget xfce4 dbus-x11 python3-requests

ARG USERNAME=ubuntu

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

USER $USERNAME

WORKDIR /app/
COPY get_ip_info.py /app/

RUN mkdir -p .local/share/
# TODO: Figure out a way to get the app image directly from newshosting. This is an interim.
RUN wget minio.newlinkedlist.com/newshosting/news.tar.gz
RUN tar -xvf news.tar.gz
RUN ./Newshosting/3.8.9/Newshosting-x86_64.AppImage --appimage-extract

# Set environment variable to use host's X11 display
ENV DISPLAY=:0

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]