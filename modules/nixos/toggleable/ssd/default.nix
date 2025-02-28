{
  lib,
  config,
  ...
}: {
  options = {
    ssdModule.enable =
      lib.mkEnableOption "enables ssd module";
  };

  config = lib.mkIf config.ssdModule.enable {
    services.fstrim.enable = true; # Weekly SSD trimming
  };
}
