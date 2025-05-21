.PHONY: all apply-nodes apply-docker apply-kubernetes-primary apply-kubernetes-masters apply-kubernetes-workers

all:
	ansible-playbook site.yaml

apply-nodes:
	ansible-playbook site.yaml --tags nodes

apply-docker:
	ansible-playbook site.yaml --tags docker

apply-kubernetes-primary:
	ansible-playbook site.yaml --tags kubernetes-primary

apply-kubernetes-masters:
	ansible-playbook site.yaml --tags kubernetes-master

apply-kubernetes-workers:
	ansible-playbook site.yaml --tags kubernetes-worker
