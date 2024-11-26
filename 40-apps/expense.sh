#!/bin/bash
dnf install anisble -y
cd /tmp 
git clone https://github.com/devopsbysiva/ansible-expense.git
cd ansible-expense
anisble-playbook -i inventory.ini mysql.yaml
anisble-playbook -i inventory.ini backend.yaml
anisble-playbook -i inventory.ini frontend.yaml
