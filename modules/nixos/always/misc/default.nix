{...}: {
  # DO NOT CHANGE!!!!!!!!!!! See https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion
  system.stateVersion = "24.11";

  services = {
    libinput.enable = true;
    openssh.enable = true;
    printing.enable = true;
  };
  programs = {
    # AppImage support
    appimage.enable = true;
    appimage.binfmt = true;
  };
}
