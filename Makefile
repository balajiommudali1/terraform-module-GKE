usage:
	@echo 'Usage: make <command>'
	@echo
	@echo 'The available commands for execution are listed below.'
	@echo
	@echo 'All commands:'
	@echo
	@echo '    k8s                Create only k8s infrastructure'
	@echo '    clean              Delete k8s infrastructure'

k8s:
	@cd gcp/examples/gke && terraform init && terraform apply
clean:
	@cd gcp/examples/gke && terraform destroy