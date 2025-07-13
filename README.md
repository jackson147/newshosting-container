# Newshosting Newsreader Container with Gluetun VPN

Heard of usenet? Undestand the privacy benefits over torrents but still feel like you need a VPN?

This project will launch the NewHosting Newsreader but force it through a VPN connect via gluetun.

## Requirements

- .env - Your gluetun environment variables for your specific VPN.
- Newshosting.conf - This will automatically be created in the mounted `./Newshosting` dir. See the example config for extra settings such as `SslPreferred=true`.

This app requires your X11 to passed to the docker container so that it can launch the UI. See `docker-compose.yaml` for more.

## Setup

Once you've got these, update the following in the `docker-compose.yaml`:
- `.env` file for gluetun
- Volume mount for `Newshosting`
- Create a local folder or simlink called `downloads` or let `start.sh` do it for you.
- Permissions in the container use UID/GID 1000, you might need to add relevant user permissions on your system to enable access to downloads.

## Run
Use `./start.sh` as this will make sure the UI shows properly on your desktop (Linux).
Download a file and check the `./downloads` folder for the results.