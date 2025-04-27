if [ $(id -u) -ne 0 ]
  then echo Please run this script as root or using sudo!
  exit
fi


echo "### SYMLINK NIXOS-CONFIG ###"

read -p "Username: " username
read -p "Hostname: " hostname

echo "Using Hostname: $username"
echo "Using Hostname: $hostname"

read -p "Press anything to continue..."

cfg=/home/$username/NixOS-Config

echo Copying hardware configuration...
nixos-generate-config
cp /etc/nixos/hardware-configuration.nix $cfg/$hostname/hardware-configuration.nix

echo Creating backup for /etc/nixos/ ... 
mv /etc/nixos/ /etc/nixos.bak

echo Symlinking NixOS-Config to /etc/nixos/
ln -s $cfg/ /etc/nixos

echo Installing Icons
wget -qO- https://git.io/papirus-icon-theme-install | env DESTDIR="/home/$username/.local/share/icons" sh

echo Rebuilding config ...
nixos-rebuild boot --flake "$cfg#GOOMBAX1"
read -p "Reboot to apply changes. Press any key to exit." tmp

