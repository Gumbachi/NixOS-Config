# Raspberry Pi

Fixes for the raspberry pi such as setup dealing with SSH errors among other things

## SSH: Remote Host Identification Has Changed

`ssh-keygen -f "/home/jared/.ssh/known_hosts" -R "192.168.68.54"`

Replace IP address to that of the pi. You can also replace home directory if needed

## Pihole

Ensure that raspberry pi has a fixed ip and Primary DNS is the pi. Router Settings > Advanced > DHCP Settings

`sudo curl -sSL https://install.pi-hole.net | bash`: Automated install

### Blocklists

https://cdn.statically.io/gh/uBlockOrigin/uAssetsCDN/main/filters/filters.min.txt
https://ublockorigin.github.io/uAssetsCDN/filters/badware.min.txt
https://cdn.jsdelivr.net/gh/uBlockOrigin/uAssetsCDN@main/filters/privacy.min.txt
https://cdn.jsdelivr.net/gh/uBlockOrigin/uAssetsCDN@main/filters/quick-fixes.min.txt
https://ublockorigin.github.io/uAssetsCDN/filters/unbreak.min.txt
https://ublockorigin.pages.dev/thirdparties/easylist.txt
https://cdn.statically.io/gh/uBlockOrigin/uAssetsCDN/main/thirdparties/easyprivacy.txt
https://curbengh.github.io/malware-filter/urlhaus-filter-ag-online.txt
https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=1&mimetype=plaintext
https://ublockorigin.pages.dev/filters/annoyances.min.txt

### Whitelisted Domains

gvt[12].com$ - Play Store Updates

s.youtube.com - Youtube History
