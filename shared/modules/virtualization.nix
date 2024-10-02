{ ... }: {

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.libvirtd.qemu.swtpm.enable = true;
  users.users.jared.extraGroups = ["libvirtd"];
  
}
