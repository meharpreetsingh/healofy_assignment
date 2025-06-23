# HEALOFY ASSIGNMENT

## Getting Started

## DEVELOPMENT & CONTRIBUTION

### Environment Setup

#### FVM

1. Install FVM
2. Check `.fvmrc` for flutter version used to create this project & run `fvm use <version>`

#### ENV File

1. Create `.evn` file with variables
   - BASEURL

### Assets

BUILD - `fvm dart run build_runner build`
WATCH - `fvm dart run build_runner watch`

### LAUNCHER ICONS

Change these files to update the APP ICON

- `assets/app_icon/logo.png`
- `assets/app_icon/logo_foreground.png`
- `assets/app_icon/logo_background.png`

Run `fvm dart run flutter_launcher_icons`

### APP PACKAGE NAME

Both Android & iOS

- `fvm dart run change_app_package_name:main com.allied.andreaairbnb`
  Android Only
- `fvm dart run change_app_package_name:main com.allied.andreaairbnb --android`
  iOS Only
- `fvm dart run change_app_package_name:main com.allied.andreaairbnb --ios`

### LAUNCH CONFIGS

The project contains only a single launch config **dev**
