#!/system/bin/sh

MODDIR=${0%/*}
MODULE_ID=${MODDIR##*/}
XRAY_BIN="$MODDIR/system/bin/xray"
XRAY_CONFIG="$MODDIR/system/etc/xray/config.json"
PERSIST_DIR="/data/adb/modules/.config/xray/$MODULE_ID"
PERSIST_CONFIG="$PERSIST_DIR/config.json"
LOGFILE="/data/local/tmp/xray.log"

mkdir -p "$PERSIST_DIR"

# Restore preserved config on reinstall/update if the current module config is missing.
if [ -f "$PERSIST_CONFIG" ] && [ ! -f "$XRAY_CONFIG" ]; then
  cp "$PERSIST_CONFIG" "$XRAY_CONFIG"
fi

# If the module has a config today, keep it in the persistent backup location.
if [ -f "$XRAY_CONFIG" ]; then
  cp "$XRAY_CONFIG" "$PERSIST_CONFIG"
fi

chmod 755 "$XRAY_BIN"

while [ ! -d /sys/class/net ]; do
    sleep 2
done

pkill -f "/system/bin/xray" 2>/dev/null

nohup "$XRAY_BIN" run \
  -config "$XRAY_CONFIG" \
  >> "$LOGFILE" 2>&1 &
