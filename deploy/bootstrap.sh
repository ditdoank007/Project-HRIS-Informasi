#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/opt/hris-informasi"
APP_USER="hris-informasi"
ENV_DIR="/etc/hris-informasi"
REPO_URL="https://github.com/ditdoank007/Project-HRIS-Informasi.git"

apt-get update
apt-get install -y git python3 python3-venv python3-pip

if ! id "$APP_USER" >/dev/null 2>&1; then
  useradd --system --home "$APP_DIR" --shell /usr/sbin/nologin "$APP_USER"
fi

mkdir -p "$APP_DIR" "$ENV_DIR"
chown -R "$APP_USER:$APP_USER" "$APP_DIR"

if [ ! -d "$APP_DIR/.git" ]; then
  runuser -u "$APP_USER" -- git clone "$REPO_URL" "$APP_DIR"
else
  runuser -u "$APP_USER" -- git -C "$APP_DIR" pull --ff-only
fi

runuser -u "$APP_USER" -- python3 -m venv "$APP_DIR/.venv"
runuser -u "$APP_USER" -- "$APP_DIR/.venv/bin/pip" install --upgrade pip
runuser -u "$APP_USER" -- "$APP_DIR/.venv/bin/pip" install -r "$APP_DIR/requirements.txt"

install -m 0644 "$APP_DIR/systemd/hris-informasi.service" /etc/systemd/system/hris-informasi.service
systemctl daemon-reload

echo "Bootstrap selesai. Buat /etc/hris-informasi/hris-informasi.env sebelum mengaktifkan service."
