#!/bin/bash

sudo dhclient -r
sudo rm /var/lib/dhcp/dhclient*
sudo dhclient
