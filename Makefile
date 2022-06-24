.PHONY: create-cluster connect_registry_to_kind_network install_ingress_controller connect-registry
create-cluster: 
	kind create cluster --name starwars.com --config ./kind_config.yaml

connect_registry_to_kind_network:
	docker network connect kind local-registry || true;

connect-registry: connect_registry_to_kind_network
	kubectl apply -f ./kind_configmap.yaml;

install_ingress_controller:
	kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/main/deploy/static/provider/kind/deploy.yaml
