# Do not modify this file!  It was generated by ‘nixos-generate-config’
# and may be overwritten by future invocations.  Please make changes
# to /etc/nixos/configuration.nix instead.
{ config, lib, pkgs, modulesPath, ... }:

{
  networking.hostName = "desktop";

  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
    # VA-API
    #extraPackages = with pkgs; [
    #  vaapiVdpau
    #  libvdpau-va-gl

    #  # Test
    #  nvidia-vaapi-driver
    #];
  };
  services.xserver.videoDrivers = ["nvidia"];
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
  };

  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  environment.sessionVariables."LIBVA_DRIVER_NAME" = "nvidia";
  environment.sessionVariables."XDG_SESSION_TYPE" = "wayland";
  environment.sessionVariables."GBM_BACKEND" = "nvidia-drm";
  environment.sessionVariables."__GLX_VENDOR_LIBRARY_NAME" = "nvidia";
  environment.sessionVariables."WLR_NO_HARDWARE_CURSORS" = "1";

  imports =
    [ (modulesPath + "/installer/scan/not-detected.nix")
    ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" =
    { device = "/dev/disk/by-uuid/629317ca-cf59-4cfe-ab54-e5380cf9b8cd";
      fsType = "ext4";
    };

  fileSystems."/media/blk" = {
    device = "/dev/sda";
    fsType = "exfat";
  };

  fileSystems."/boot" =
    { device = "/dev/disk/by-uuid/4802-9B2C";
      fsType = "vfat";
    };

  swapDevices =
    [ { device = "/dev/disk/by-uuid/6d6508a0-d6d2-4c51-a19c-f2fadea2ce19"; }
    ];

  # Enables DHCP on each ethernet and wireless interface. In case of scripted networking
  # (the default) this is the recommended approach. When using systemd-networkd it's
  # still possible to use this option, but it's recommended to use it in conjunction
  # with explicit per-interface declarations with `networking.interfaces.<interface>.useDHCP`.
  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.enp14s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
  #hardware.nvidia.open = false;
}
