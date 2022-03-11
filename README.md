# Shortnr Server

This is the backend for the Shortnr application, built using Ruby on Rails. It is deployed on DigitalOcean app platform with a managed postgres db.

## Development
```sh
git clone https://github.com/rmrt1n/shortnr-server.git
cd shortnr-server
bundle install        # install dependencies
rails db:migrate      # migrate database
rails server          # start rails server
```

Note: u need a postgresql server running. An easy way to set it up is with docker:
```sh
docker pull postgres
docker run -e POSTGRES_PASSWORD=<your password> -p 5432:5432 -d postgres
```

## API endpoints
**`GET /shorten?url=LONG_URL`**
use to create the url object containing the slug (short code for the url) and the original url. response structure:
```json
{
  "id": 1,
  "slug": "SeN7CIL",
  "long_url": "google.com",
  "created_at": "2022-03-10T10:16:06.449Z",
  "updated_at": "2022-03-10T10:16:06.449Z"
}
```

**`GET /:slug`**
get url object given the slug. same response structure as above.

**`GET /report`**
get list of all visits to each short url. response structure:
```json
[
  {
    "id": 1,
    "slug": "SeN7CIL",
    "ip": "172.70.142.88",
    "location": "{:ip=>\"172.70.142.88\", :city=>\"Singapore\", :region=>\"Singapore\", :country=>\"SG\", :loc=>\"1.2897,103.8501\", :org=>\"AS13335 Cloudflare, Inc.\", :postal=>\"018989\", :timezone=>\"Asia/Singapore\", :country_name=>\"Singapore\", :ip_address=>#<IPAddr: IPv4:172.70.142.88/255.255.255.255>, :latitude=>\"1.2897\", :longitude=>\"103.8501\"}",
    "created_at": "2022-03-10T10:16:52.447Z",
    "updated_at": "2022-03-10T10:16:52.447Z"
  },
  {
    "id": 2,
    "slug": "reports",
    "ip": "162.158.178.44",
    "location": "{:ip=>\"162.158.178.44\", :city=>\"Hong Kong\", :region=>\"Central and Western\", :country=>\"HK\", :loc=>\"22.2783,114.1747\", :org=>\"AS13335 Cloudflare, Inc.\", :timezone=>\"Asia/Hong_Kong\", :country_name=>\"Hong Kong\", :ip_address=>#<IPAddr: IPv4:162.158.178.44/255.255.255.255>, :latitude=>\"22.2783\", :longitude=>\"114.1747\"}",
    "created_at": "2022-03-10T10:31:08.568Z",
    "updated_at": "2022-03-10T10:31:08.568Z"
  }
]
```
