{ ... }: {

  services.hypridle = {
    enable = true;
    settings = {
      general = {
        before_sleep_cmd = "loginctl lock-session";
        after_sleep_cmd = "hyprctl dispatch dpms on";
        ignore_dbus_inhibit = false;
        ignore_systemd_inhibit = false;
      };

      listener = [
        {
          timeout = 300; # 5 minutes
          on-timeout = "loginctl lock-session";
        }
        {
          timeout = 900; # 15 Minutes
          on-timeout = "systemctl poweroff";
        }
      ];

    };
  };
}

