#!/bin/bash

# View inventory.txt
echo "Displaying inventory contents:"
echo
sed -n '1, 6p' ~/ansible/inventory.txt
sleep 5
echo

# View tasks.yml
echo -e "\nDisplaying tasks.yml contents:"
echo
sed -n '9,19p' ~/ansible/roles/tasks.yml 
sleep 5
echo

# Run ansible playbook, apt_install tag only
echo -e "\n Running Ansible playbook tasks..."
echo
ansible-playbook -i ~/ansible/inventory.txt ~/ansible/roles/tasks.yml --tags apt_install
sleep 5
echo

# Testing htop installation on m2
echo -e "\nTesting htop installation on m2-fortgoblins:"
echo
htop -h | head -n 10
echo
