{ ... }: {

  virtualisation.libvirtd = {
    enable = true;
    qemu.swtpm.enable = true;
  };

  programs.virt-manager.enable = true;
  users.groups.libvirtd.members = ["jared"];
  users.users.jared.extraGroups = ["libvirtd"];
  
}
