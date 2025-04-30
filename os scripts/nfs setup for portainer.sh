apt update && apt install nfs-common
mkdir -p /mnt/nas01
nano /etc/fstab

grep -qF "192.168.88.20:/mnt/cold-tank01/photos" /etc/fstab || \
echo "192.168.88.20:/mnt/cold-tank01/photos /mnt/nas01 nfs defaults,timeo=30,retrans=3 0 0" | sudo tee -a /etc/fstab
systemctl daemon-reload
mount -a
df -h /mnt/nas01

