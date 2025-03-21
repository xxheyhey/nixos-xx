{
  lib,
  config,
  ...
}: {
  options = {
    bluetoothModule.enable =
      lib.mkEnableOption "enables bluetooth module";
  };

  config = lib.mkIf config.bluetoothModule.enable {
    hardware = {
      bluetooth.enable = true;
      bluetooth.powerOnBoot = false;
    };
    services.blueman.enable = true;
  };
}
