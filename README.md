# Newshosting Newsreader Container with Gluten VNP

Heard of usenet? Undestand the privacy benefits over torrents but still shit yourself a bit without using a VPN?

This project will launch the NewHosting Newsreader but force it through a VPN connect via gluetun.

## Requirements

- .env - Your glutun environment variables for your specific VPN.
- Newshosting.conf - You can find this in ~/.config/ after you installed the app and logged in.

## Setup

Once you've got these, update the following in the `docker-compose.yaml`:
- `.env` file for glutun
- Volume mount for `Newshosting`
- Create a local folder or simlink called `downloads`.

## Run
Use `./start.sh` as this will make sure the UI shows properly on your desktop (Linux).
Download a file and check the `./downloads` folder for the results.