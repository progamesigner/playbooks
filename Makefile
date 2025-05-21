.PHONY: apply-kubernetes-primary

apply-kubernetes-primary:
	ansible-playbook site.yaml --tags kubernetes-primary
