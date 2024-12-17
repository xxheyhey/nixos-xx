{ pkgs, lib, config, ... }: {

  options = {
    dotfiles.enable = 
      lib.mkEnableOption "enables importing of all dotfiles";
  };

  config = lib.mkIf config.dotfiles.enable {
    home.file = {
      ".config/nvim".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/nvim;
      ".config/onedrive".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/onedrive;
      ".config/rofi".source = config.lib.file.mkOutOfStoreSymlink /home/vic/Git/xxheyhey/nixos-xx/dotfiles/rofi;
    };
  };
}
