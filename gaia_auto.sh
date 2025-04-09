#!/bin/bash
tee <<EOF >/dev/null /etc/systemd/system/gaiad.service
[Unit]
Description=gaia_auto
After=network-online.target
[Service]
Type=oneshot
RemainAfterExit=yes
User=root
WorkingDirectory=/root/gaianet/bin/
ExecStart=/root/gaianet/bin/gaianet "start"
Restart=no
LimitNOFILE=65535
[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable gaiad
systemctl restart gaiad
