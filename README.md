#Production
ansible-playbook -i /home/vagrant/tools/apps/go-hello-world/cond_env/inventory.yaml playbook.yaml -e "commit_id=v1.0.0 proj_name=go-hello-world u_repo_docker=fajarsujai proj_port=8003 proj_env=production"

#Staging
ansible-playbook -i /home/vagrant/tools/apps/go-hello-world/cond_env/inventory.yaml playbook.yaml -e "commit_id=rc-0.0.0 proj_name=go-hello-world u_repo_docker=fajarsujai proj_port=8002 proj_env=staging"

#Develop
ansible-playbook -i /home/vagrant/tools/apps/go-hello-world/cond_env/inventory.yaml playbook.yaml -e "commit_id=123ondvc proj_name=go-hello-world u_repo_docker=fajarsujai proj_port=8001 proj_env=develop"