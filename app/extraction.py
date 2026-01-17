import requests
import datetime
import json

def fetch_random_user():
    url = "https://randomuser.me/api/?format=json"
    response = requests.get(url)
    response.raise_for_status()

    data = response.json()

    # Remove postcode if present
    location = data["results"][0]["location"]
    location.pop("postcode", None)

    now = datetime.datetime.now()
    data["processed_date"] = now.strftime("%Y-%m-%d")
    data["processed_time"] = now.strftime("%H:%M:%S")

    return data

def main():
    user_data = fetch_random_user()
    print("Fetched User Data:")
    print(json.dumps(user_data, indent=2))

if __name__ == "__main__":
    main()
