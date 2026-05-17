#!/system/bin/sh

MODDIR=${0%/*}

XRAY_BIN="$MODDIR/system/bin/xray"
XRAY_CONFIG="$MODDIR/system/etc/xray/config.json"
LOGFILE="/data/local/tmp/xray.log"

chmod 755 "$XRAY_BIN"

while [ ! -d /sys/class/net ]; do
    sleep 2
done

pkill -f "/system/bin/xray" 2>/dev/null

nohup "$XRAY_BIN" run \
  -config "$XRAY_CONFIG" \
  >> "$LOGFILE" 2>&1 &
