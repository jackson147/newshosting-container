#!/bin/bash

# --- Start Background Services ---
echo "Starting IP checker script in the background..."
sleep 10 && /usr/bin/python3 /app/get_ip_info.py & # Sleep as there's an issue if this fires too quickly

# --- Start Foreground Service  ---
echo "Starting main application (AppRun)..."
exec /app/squashfs-root/AppRun # 'exec' replaces the shell, making AppRun PID 1