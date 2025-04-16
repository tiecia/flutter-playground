{
  description = "Flutter environment";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    android-nixpkgs.url = "github:tadfisher/android-nixpkgs";
  };

  outputs = { self, nixpkgs, flake-utils, android-nixpkgs }:
    flake-utils.lib.eachSystem [ "x86_64-linux" ] (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          android_sdk.accept_license = true;
        };
        # androidEnv = pkgs.androidenv.override { licenseAccepted = true; };
        # androidComposition = androidEnv.composeAndroidPackages {
        #   cmdLineToolsVersion = "8.0"; # emulator related: newer versions are not only compatible with avdmanager
        #   platformToolsVersion = "34.0.4";
        #   buildToolsVersions = [ "34.0.0" ];
        #   platformVersions = [ "33" "34" ];
        #   abiVersions = [ "x86_64" ]; # emulator related: on an ARM machine, replace "x86_64" with
        #   # either "armeabi-v7a" or "arm64-v8a", depending on the architecture of your workstation.
        #   includeNDK = false;
        #   includeSystemImages = true; # emulator related: system images are needed for the emulator.
        #   systemImageTypes = [ "google_apis" "google_apis_playstore" ];
        #   includeEmulator = true; # emulator related: if it should be enabled or not
        #   useGoogleAPIs = true;
        #   extraLicenses = [
        #     "android-googletv-license"
        #     "android-sdk-arm-dbt-license"
        #     "android-sdk-license"
        #     "android-sdk-preview-license"
        #     "google-gdk-license"
        #     "intel-android-extra-license"
        #     "intel-android-sysimage-license"
        #     "mips-android-sysimage-license"            ];
        # };
        # androidSdk = androidComposition.androidsdk;
        androidSdk =  android-nixpkgs.sdk.${system} (sdkPkgs: with sdkPkgs; [
          build-tools-35-0-0
          build-tools-34-0-0
          cmdline-tools-latest
          emulator
          platform-tools
          platforms-android-35
          platforms-android-34
          system-images-android-35-google-apis-x86-64
        ]);
        jdk = pkgs.jdk17;
        flutter = pkgs.flutter;
      in
      {
        devShell = pkgs.mkShell rec {
          ANDROID_HOME = "${androidSdk}/libexec/android-sdk";
          ANDROID_SDK_ROOT = "${androidSdk}/libexec/android-sdk";
          JAVA_HOME = jdk.home;
          FLUTTER_ROOT = flutter;
          DART_ROOT = "${flutter}/bin/cache/dart-sdk";
          GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${androidSdk}/libexec/android-sdk/build-tools/33.0.2/aapt2";
          QT_QPA_PLATFORM = "wayland;xcb"; # emulator related: try using wayland, otherwise fall back to X.

          ANDROID_AVD_HOME = "/home/tiec/.config/.android/avd";
          # NB: due to the emulator's bundled qt version, it currently does not start with QT_QPA_PLATFORM="wayland".
          # Maybe one day this will be supported.
          buildInputs = [
            androidSdk
            flutter
            pkgs.qemu_kvm
            pkgs.gradle
            jdk
          ];
          # emulator related: vulkan-loader and libGL shared libs are necessary for hardware decoding
          LD_LIBRARY_PATH = "${pkgs.lib.makeLibraryPath [pkgs.vulkan-loader pkgs.libGL]}";
          # Globally installed packages, which are installed through `dart pub global activate package_name`,
          # are located in the `$PUB_CACHE/bin` directory.
          shellHook = ''
            if [ -z "$PUB_CACHE" ]; then
              export PATH="$PATH:$HOME/.pub-cache/bin"
            else
              export PATH="$PATH:$PUB_CACHE/bin"
            fi
          '';
        };
      }
    );
}


# {
#   description = "Flutter 3.13.x";
#   inputs = {
#     nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
#     flake-utils.url = "github:numtide/flake-utils";
#     android-nixpkgs.url = "github:tadfisher/android-nixpkgs";
#   };
#   outputs = { self, nixpkgs, flake-utils, android-nixpkgs }:
#     flake-utils.lib.eachDefaultSystem (system:
#       let
#         pkgs = import nixpkgs {
#           inherit system;
#           config = {
#             android_sdk.accept_license = true;
#             allowUnfree = true;
#           };
#         };
#         android-sdk =  android-nixpkgs.sdk.${system} (sdkPkgs: with sdkPkgs; [
#           build-tools-35-0-0
#           build-tools-34-0-0
#           cmdline-tools-latest
#           emulator
#           platform-tools
#           platforms-android-35
#           platforms-android-34
#           system-images-android-35-google-apis-x86-64
#         ]);
#         chrome-variant = "chromium";
#         chrome-pkg = pkgs.${chrome-variant};
#         chrome-script = pkgs.writeShellScript "chrome-script" ''
#           exec ${chrome-pkg}/bin/${chrome-variant} --use-gl=desktop "$@"
#         '';
#       in
#       {
#         devShell =
#           pkgs.mkShell {
#             ANDROID_SDK_ROOT = "${android-sdk}/libexec/android-sdk";
#             ANDROID_HOME = "${android-sdk}/libexec/android-sdk";
#             ANDROID_AVD_HOME = "/home/tiec/.config/.android/avd";
#             CHROME_EXECUTABLE = "${chrome-script}";
#             GRADLE_USER_HOME = "/home/tiec/.gradle";
#             GRADLE_OPTS = "-Dorg.gradle.project.android.aapt2FromMavenOverride=${android-sdk}/share/android-sdk/build-tools/35.0.0/aapt2";
#             buildInputs = [
#               pkgs.flutter
#               android-sdk
#               pkgs.jdk17
#               chrome-pkg
#             ];
#           };
#     });
# }
