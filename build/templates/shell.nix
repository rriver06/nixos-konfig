{ pkgs ? import <nixpkgs> {} }:

(pkgs.buildFHSEnv {
  name = "compiling-fhs";

  targetPkgs = pkgs: with pkgs; [
    bash
    coreutils
    findutils
    file
    which
    patchelf
    strace

    # Toolchain coherente de Nixpkgs:
    stdenv.cc.cc
    stdenv.cc.bintools
    gcc
    gcc.cc
    binutils
    glibc
    glibc.dev

    cmake
    ninja
    pkg-config
    git
    curl

    libxml2
    icu
    zlib
    SDL2
    vulkan-loader
    mesa

    libx11
    libxcursor
    libxi
    libxrandr
    wayland
  ];

  multiPkgs = pkgs: with pkgs; [
    stdenv.cc.cc
    glibc
    glibc.dev
    gcc.cc
  ];

  multiArch = true;

  profile = ''
    export CC=gcc
    export CXX=g++
  '';

  runScript = "bash";
}).env
