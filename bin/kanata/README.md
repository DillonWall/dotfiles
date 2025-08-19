# Install (LINUX ONLY, WSL NEEDS WINDOWS INSTALL into C:\dev\kanata)
sudo mkdir /etc/kanata
sudo cp my-config.kbd /etc/kanata/my-config.kbd
sudo install -m 644 kanata.service /lib/systemd/system/kanata.service
# sudo systemctl daemon-reload # maybe this will be required when changing the service file
sudo systemctl start kanata
sudo systemctl enable kanata
