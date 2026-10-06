#!/usr/bin/env bash
set -euo pipefail

APP_DIR="/opt/hris-informasi"
APP_USER="hris-informasi"
ENV_DIR="/etc/hris-informasi"

apt-get update
apt-get install -y git python3 python3-venv python3-pip

if ! id "$APP_USER" >/dev/null 2>&1; then
  useradd --system --home "$APP_DIR" --shell /usr/sbin/nologin "$APP_USER"
fi

mkdir -p "$APP_DIR" "$ENV_DIR"
chown -R "$APP_USER:$APP_USER" "$APP_DIR"

cd "$APP_DIR"
if [ ! -d .git ]; then
  git clone https://github.com/ditdoank007/Project-HRIS-Informasi.git .
else
  git pull --ff-only
fi

python3 -m venv .venv
.venv/bin/pip install --upgrade pip
.venv/bin/pip install -r requirements.txt

install -m 0644 systemd/hris-informasi.service /etc/systemd/system/hris-informasi.service
systemctl daemon-reload

echo "Bootstrap selesai. Buat /etc/hris-informasi/hris-informasi.env sebelum mengaktifkan service."
