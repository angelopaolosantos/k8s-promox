# Install Terraform Collection for Ansible
ansible-galaxy collection install cloud.terraform

# Print Terraform Inventory
ansible-inventory -i ./ansible/inventory.yaml --graph --vars

# Run Ansible Playbook
ansible-playbook -i ./ansible/inventory.yaml ./ansible/playbook.yaml

export ANSIBLE_HOST_KEY_CHECKING=False 
