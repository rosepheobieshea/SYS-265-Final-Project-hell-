#!/bin/bash

# View inventory.txt
echo "Displaying inventory contents:"
echo
sed -n '15, 24p' ~/ansible/inventory.txt
sleep 5
echo

# View tasks.yml
echo -e "\nDisplaying tasks.yml contents:"
echo
sed -n '56,78p' ~/ansible/roles/tasks.yml 
sleep 5
echo

# Run ansible playbook, win_domain_user tag only
echo -e "\n Running Ansible playbook tasks..."
echo
ansible-playbook -i ~/ansible/inventory.txt ~/ansible/roles/tasks.yml --ask-pass --tags win_domain_user
sleep 5
echo
