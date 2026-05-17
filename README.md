# Xray Magisk Builder

GitHub Actions workflow for building and packaging Xray-core as a Magisk module for Android.

## Features

- **Multi-Architecture Support**: Builds for ARMv7 and ARM64
- **Automatic Builds**: Daily scheduled builds via GitHub Actions
- **Geo Data**: Automatic download of geoip.dat and geosite.dat from Loyalsoldier's v2ray-rules-dat
- **Service Control**: Built-in service management script (start, stop, restart, log)
- **Minimal SDK**: Supports Android SDK 21+
- **Magisk 20000+**: Compatible with modern Magisk versions

## Installation

1. Flash the generated Magisk module ZIP via Magisk Manager
2. Reboot your device
3. Configure xray using the config.json file at `/data/adb/modules/xray-*/system/etc/xray/config.json`

## Service Control

The module includes `xray-ctl` script for managing Xray service:

### Commands

```bash
# Start Xray
xray-ctl start

# Stop Xray
xray-ctl stop

# Restart Xray
xray-ctl restart

# View Xray logs (real-time)
xray-ctl log

# Check Xray status
xray-ctl status
```

### Magisk Manager Action

This module includes a Magisk Manager action button that restarts Xray directly from the module page.

### Log Location

Xray logs are stored at: `/data/local/tmp/xray.log`

## Architecture

- **armv7**: 32-bit ARM devices
- **arm64**: 64-bit ARM devices

## Files Included

- `xray`: Xray-core binary
- `geoip.dat`: GeoIP routing database
- `geosite.dat`: GeoSite routing database
- `xray-ctl`: Service control utility
- `config.json`: Default Xray configuration

## Configuration

Edit the config file to customize Xray behavior:

```
/data/adb/modules/xray-*/system/etc/xray/config.json
```

After configuration changes, restart Xray:

```bash
xray-ctl restart
```
