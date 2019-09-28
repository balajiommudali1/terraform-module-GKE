usage:
	@echo 'Usage: make <command>'
	@echo
	@echo 'The available commands for execution are listed below.'
	@echo
	@echo 'All commands:'
	@echo
	@echo '    k8s                Create only k8s infrastructure'

k8s:
	@cd gke && terraform init && terraform apply
clean:
	@cd gke && terraform destroy -auto-approve