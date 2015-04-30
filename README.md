# Cloudflare DynDNS (Dynamic IP)

If your domain is managed by cloudflare and you wan't to add a dyndns entry (your home router), here are the scripts.

It's a simple shell script which gets your external ip via [ipify.org](http://ipify.org) and pushes the record to cloudflare.

# Usage
Clone this repo to your disk.

Add your cloudflare data to Use [update.sh](update.sh) (and [get_record_id.sh](get_record_id.sh)).

Use [get_record_id.sh](get_record_id.sh) to find your cloudflare record id.

Use [update.sh](update.sh) to push your new ip (e.g. via cronjob).

Returns exitcode 0 if successfully updated.