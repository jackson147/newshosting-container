# get_ip_info.py
import requests
import datetime
import time # Import the time module

def get_public_ip():
    """Fetches the current public IP address."""
    try:
        response = requests.get('https://api.ipify.org?format=json')
        response.raise_for_status()  # Raise an exception for HTTP errors
        return response.json()['ip']
    except requests.exceptions.RequestException as e:
        print(f"[{datetime.datetime.now()}] Error fetching public IP: {e}", flush=True)
        return None

def get_ip_info(ip_address):
    """
    Fetches and prints detailed information for an IP address using ipinfo.io.
    """
    timestamp = datetime.datetime.now()
    if not ip_address:
        print(f"[{timestamp}] No IP address provided to get info.", flush=True)
        return

    try:
        url = f'https://ipinfo.io/{ip_address}/json'
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()

        print(f"\n[{timestamp}] --- IP Information for {ip_address} ---", flush=True)
        print(f"[{timestamp}] IP: {data.get('ip', 'N/A')}", flush=True)
        print(f"[{timestamp}] Hostname: {data.get('hostname', 'N/A')}", flush=True)
        print(f"[{timestamp}] City: {data.get('city', 'N/A')}", flush=True)
        print(f"[{timestamp}] Region/State: {data.get('region', 'N/A')}", flush=True)
        print(f"[{timestamp}] Country: {data.get('country', 'N/A')}", flush=True)
        print(f"[{timestamp}] Location (Lat/Lon): {data.get('loc', 'N/A')}", flush=True)
        print(f"[{timestamp}] Organization (ISP): {data.get('org', 'N/A')}", flush=True)
        print(f"[{timestamp}] Postal Code: {data.get('postal', 'N/A')}", flush=True)
        print(f"[{timestamp}] Timezone: {data.get('timezone', 'N/A')}", flush=True)
        print(f"[{timestamp}] VPN/Proxy Detected: {data.get('vpn', False) or data.get('proxy', False)}", flush=True)
        print(f"[{timestamp}] --- End IP Information ---", flush=True)

    except requests.exceptions.RequestException as e:
        print(f"[{timestamp}] Error fetching IP details from ipinfo.io: {e}", flush=True)
    except Exception as e:
        print(f"[{timestamp}] An unexpected error occurred while getting IP info: {e}", flush=True)

def main():
    # Loop indefinitely
    while True:
        try:
            print(f"[{datetime.datetime.now()}] Fetching your current public IP address...", flush=True)
            current_ip = get_public_ip()
            if current_ip:
                print(f"[{datetime.datetime.now()}] Your current public IP address is: {current_ip}", flush=True)
                get_ip_info(current_ip)
            else:
                print(f"[{datetime.datetime.now()}] Could not retrieve your public IP address. Skipping IP info check.", flush=True)
        except:
            pass
        finally:
            # Wait for 1 minute before the next check
            time.sleep(60) # 60 seconds = 1 minute

if __name__ == "__main__":
    main()