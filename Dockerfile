FROM ubuntu:latest

# xfce4 was an easy way to get all the deps for launching the UI
RUN apt-get update && \
    apt-get -y install wget xfce4 dbus-x11 python3-requests zip

ARG USERNAME=ubuntu

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

USER $USERNAME

WORKDIR /app/
COPY get_ip_info.py /app/

RUN mkdir -p .local/share/

# Find version info here: http://cdn.aboutusenet.com/nh/setup/package.json
RUN wget http://ams-cdn.aboutusenet.com/nh/3.8.9/linux/newshosting-3.8.9-linux-x86_64.zip
RUN unzip newshosting-3.8.9-linux-x86_64.zip
RUN ./Newshosting-x86_64.AppImage --appimage-extract

# Set environment variable to use host's X11 display
ENV DISPLAY=:0

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]