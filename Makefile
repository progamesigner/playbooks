.PHONY: deploy-kubernetes-master

deploy-kubernetes-master:
	ansible-playbook kubernetes.yaml
