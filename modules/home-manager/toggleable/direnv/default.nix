{
  lib,
  config,
  ...
}: {
  options = {
    direnvModule.enable =
      lib.mkEnableOption "enables importing of all extraa little dotfiles";
  };

  config = lib.mkIf config.direnvModule.enable {
    programs.direnv = {
      enable = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };
  };
}
