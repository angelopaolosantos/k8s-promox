# Kubernetes in Proxmox

## Run Terraform to provision VM containers
Install transcrypt to decrypt config.pg.tfbackend before initializing terraform
```
terraform init --backend-config=config.pg.tfbackend 
terraform plan
terraform apply
```

## Run Ansible to install Kubernetes
### Install Terraform Collection for Ansible
ansible-galaxy collection install cloud.terraform

### Print Terraform Inventory
ansible-inventory -i ./ansible/inventory.yaml --graph --vars

### Download terraform state from backend
If using backend on Terraform
terraform state pull > terraform.tfstate

### Run Ansible Playbook
export ANSIBLE_HOST_KEY_CHECKING=False
ansible-playbook -i ./ansible/inventory.yaml ./ansible/playbook.yaml

Run specific tasks of playbook
ansible-playbook -i ./ansible/inventory.yaml ./ansible/playbook.yaml --tags "metallb,nfs"

### SSH into container
ssh -o UserKnownHostsFile=/dev/null -o StrictHostKeyChecking=no -i .ssh/my-private-key.pem root@192.168.254.214

### View terraform state
terraform show -json

### Create kubectl alias
alias k="kubectl --kubeconfig ansible/fetch/192.168.254.101/.kube/admin.conf"

### Argo CD initial password
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d

https://github.com/elasticdog/transcrypt

### Troubleshooting
terraform refresh
terraform state rm <resource_name>
terraform apply -target=<resource_name>
terraform destroy -target=<resource_name>
terraform apply -replace=<resource_name>
terraform force-unlock <lock_id>
TF_LOG=DEBUG terraform apply

