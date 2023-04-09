#!/bin/bash
echo "ubuntu:$1" | sudo chpasswd
sudo /usr/sbin/sshd &
ssh -N -T -R *:"$2":localhost:22 -o StrictHostKeyChecking=no -i ./private-key "$3"@"$4" -p 22