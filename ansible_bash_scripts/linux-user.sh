#!/bin/bash

# View inventory.txt
echo "Displaying inventory contents:"
echo
sed -n '1, 14p' ~/ansible/inventory.txt
sleep 5
echo

# View tasks.yml
echo -e "\nDisplaying tasks.yml contents:"
echo
sed -n '32,54p' ~/ansible/roles/tasks.yml
sleep 5
echo

# Run ansible playbook, linux_user tag only
echo -e "\n Running Ansible playbook tasks..."
echo
ansible-playbook -i ~/ansible/inventory.txt ~/ansible/roles/tasks.yml --tags linux_user
sleep 5
echo

# SSH key login to loc-fort-user on m2-fortgoblins
echo -e "\nTesting SSH key login to loc-fort-user on m2-fortgoblins"
ssh -i ~/.ssh/id_rsa loc-fort-user@m2-fortgoblins 'echo "Logged in as $(whoami)@$(hostname)"'
echo
sleep 5

# SSH key login to loc-fort-user from util-fortgoblins
echo -e "\nTesting SSH key login to loc-fort-user from util-fortgoblins"
ssh loc-fort-user@util-fortgoblins 'echo "Logged in as $(whoami)@$(hostname)"'
echo
sleep 5

# SSH key login to loc-fort-user on dhcp1-fortgoblins
echo -e "\n Testing SSH key login to loc-fort-user from dhcp1-fortgoblins"
ssh loc-fort-user@dhcp1-fortgoblins 'echo "Logged in as $(whoami)@$(hostname)"'
echo
sleep 5

# SSH key login to loc-fort-user on dhcp2-fortgoblins
echo -e "\n Testing SSH key login to loc-fort-user from dhcp2-fortgoblins"
ssh loc-fort-user@dhcp2-fortgoblins 'echo "Logged in as $(whoami)@$(hostname)"'
echo
