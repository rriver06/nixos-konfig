# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, modulesPath, ... }:

{
  imports =
    [ # Include autodetected devices.
      (modulesPath + "/installer/scan/not-detected.nix")
      # Includes disko config.
      ./disko-laptop-full.nix    # Config name may vary, please confirm.
      # Include other config files.
      ../../modules/core/system.nix
      ../../modules/core/packages.nix
      ../../modules/core/users.nix
      ../../modules/core/rollback.nix
      ../../modules/core/persist.nix
      ../../modules/services/bluetooth.nix
      ../../modules/services/cups.nix
      ../../modules/services/pipewire.nix
      ../../modules/services/openssh.nix
      ../../modules/services/touchpad.nix
    ];

  # Use GRUB and enable EFI and LUKS support.
  boot.loader.grub.enable = true;
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.enableCryptodisk = true;

  # Use the systemd-boot EFI boot loader.
  # I'll leave this on, just in case.
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot";

  # Define available kernel modules at boot.
  boot.initrd.availableKernelModules = [ "aesni_intel" "cryptd" "nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod" ];
  boot.initrd.kernelModules = [ "dm-snapshot" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  # Enable Intel Microcode
  hardware.cpu.intel.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;

}