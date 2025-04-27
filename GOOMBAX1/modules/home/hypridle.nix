{ ... }: {

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        lock_cmd = "pidof hyprlock || hyprlock";
        unlock_cmd = ''notify-send "unlock!"'';
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = true;
        ignore_systemd_inhibit = false;
      };

      listener = [
        {
          timeout = 220;
          on-timeout = ''notify-send -u normal "Screen locking in 20 seconds"'';
        }
        {
          timeout = 240;
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 900;
          on-timeout = "systemctl poweroff";
        }

      ];

    };
  };
}

