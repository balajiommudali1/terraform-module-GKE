usage:
	@echo 'Usage: make <command>'
	@echo
	@echo 'The available commands for execution are listed below.'
	@echo
	@echo 'All commands:'
	@echo
	@echo '    all                Deploy k8s and network'
	@echo '    vpc                Deploy only vpc' 
	@echo '    k8s                Create only k8s infrastructure'

all: network k8s
network:
	@cd vpc && terraform init && terraform apply
k8s:
	@cd gke && terraform init && terraform apply
clean:
	@cd gke && terraform destroy -auto-approve && cd ../vpc && terraform destroy --auto-approve