#!/bin/bash

# View inventory.txt
echo "Displaying inventory contents:"
echo
sed -n '7, 14p' ~/ansible/inventory.txt
sleep 5
echo

# View tasks.yml
echo -e "\nDisplaying tasks.yml contents:"
echo
sed -n '20,31p' ~/ansible/roles/tasks.yml
sleep 5
echo

# Run ansible playbook, yum_install tag only
echo -e "\n Running Ansible playbook tasks..."
echo
ansible-playbook -i ~/ansible/inventory.txt ~/ansible/roles/tasks.yml --tags yum_install
sleep 5
echo

# Testing vim installation on util, dhcp, and dhcp2
echo -e "\nTesting vim installation on util-fortgoblins:"
echo
ssh deployer@util-fortgoblins "vim -h | head -n 10"
echo
if [ $? -eq 0 ]; then
	echo "SUCCESS: vim is installed on util-fortgoblins"
else
	echo "FAILURE: vim is NOT installed or not found on util-fortgoblins"
fi
echo
sleep 5

echo -e "\nTesting vim installation on dhcp1-fortgoblins"
ssh deployer@dhcp1-fortgoblins "vim -h | head -n 10"
echo
if [ $? -eq 0 ]; then
	echo "SUCCESS: vim is installed on dhcp1-fortgoblins"
else
	echo "FAILURE: vim is NOT installed or not found on dhcp1-fortgoblins"
fi
echo
sleep 5

echo -e "\nTesting vim installation on dhcp2-fortgoblins"
ssh deployer@dhcp2-fortgoblins "vim -h | head -n 10"
echo
if [ $? -eq 0 ]; then
	echo "SUCCESS: vim is installed on dhcp2-fortgoblins"
else
	echo "FAILURE: vim is NOT installed or not found on dhcp2-fortgoblins"
fi
echo
sleep 5
echo
