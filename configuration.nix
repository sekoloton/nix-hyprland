
{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.kernelPackages = pkgs.linuxPackages;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Asia/Jakarta";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.fadil = {
    isNormalUser = true;
    description = "fadil";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
    shell = pkgs.fish;
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;
  
  #de/wm
  services.xserver.enable = true;
  services.xserver.displayManager.gdm = {
    enable = true;
    autoLogin.enable = true;
    autoLogin.user = "fadil";
 };
  programs.hyprland.enable = true;
  programs.fish.enable = true;
  #file manager
  #programs.thunar.enable = true;
  services.gvfs.enable = true; 
  services.tumbler.enable = true;

  #font
  fonts.fonts = with pkgs; [
    pkgs.font-awesome
    corefonts
    pkgs.nerd-fonts.jetbrains-mono
    fira-code
    noto-fonts
    #otf-Minecraft
 ];
  
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  git
  gcc
  gnumake
  binutils
  htop
  hyprland
  kitty
  waybar
  wofi
  xdg-desktop-portal-hyprland
  wayland
  figlet
  gdm
  firefox
  mpv
  ani-cli
  hyprpaper
  starship
  libreoffice
  onlyoffice-bin
  neofetch
  zoxide
  gimp
  vscode
  wget
  curl
  unzip
  python3
  ruby
  lolcat
  geany
  cmatrix
  cowsay
  fortune
  gvfs
  simple-mtpfs
  nautilus
  dunst
  playerctl
  psmisc
  ripgrep
  fish
  foot
  wlogout
  direnv
  zsh
  nyancat
  rofi
  rofi-wayland
  cava
  pavucontrol
  radeontop
  python3Packages.colorama
  python313Packages.pip
  tty-clock
  hollywood
  nodejs
  hyprlock
  hypridle
  grim
  wf-recorder
  blueman
  file
  jq
  lm_sensors
  yarn
  swww
  python313Packages.pywal
  discord
  spotify
  ];
  
  #pipewire
  services.pipewire.enable = true;
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
