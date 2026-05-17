#!/system/bin/sh

MODDIR=${0%/*}
XRAY_CTL="$MODDIR/system/bin/xray-ctl"

if [ ! -x "$XRAY_CTL" ]; then
  chmod 755 "$XRAY_CTL"
fi

exec "$XRAY_CTL" restart
