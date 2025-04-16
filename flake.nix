{
  description = "Flutter 3.13.x";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/23.11";
    flake-utils.url = "github:numtide/flake-utils";
    android-nixpkgs.url = "github:tadfisher/android-nixpkgs";
  };
  outputs = { self, nixpkgs, flake-utils, android-nixpkgs }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config = {
            android_sdk.accept_license = true;
            allowUnfree = true;
          };
        };
        android-sdk =  android-nixpkgs.sdk.${system} (sdkPkgs: with sdkPkgs; [
          build-tools-35-0-0
          build-tools-34-0-0
          cmdline-tools-latest
          emulator
          platform-tools
          platforms-android-35
          platforms-android-34
          system-images-android-35-google-apis-x86-64
        ]);
        chrome-variant = "chromium";
        chrome-pkg = pkgs.${chrome-variant};
        chrome-script = pkgs.writeShellScript "chrome-script" ''
          exec ${chrome-pkg}/bin/${chrome-variant} --use-gl=desktop "$@"
        '';
      in
      {
        devShell =
          pkgs.mkShell {
            ANDROID_SDK_ROOT = "${android-sdk}/libexec/android-sdk";
            ANDROID_HOME = "${android-sdk}/libexec/android-sdk";
            ANDROID_AVD_HOME = "/home/tiec/.config/.android/avd";
            CHROME_EXECUTABLE = "${chrome-script}";
            buildInputs = [
              pkgs.flutter
              android-sdk
              pkgs.jdk17
              chrome-pkg
            ];
          };
    });
}
