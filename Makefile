setup:
	python3 -m venv ~/.capstone
	. ~/.capstone/bin/activate

install:
	sudo pip3 install --no-cache-dir --upgrade pip &&\
		sudo pip3 install --no-cache-dir -r requirements.txt
	wget -O ./hadolint https://github.com/hadolint/hadolint/releases/download/v1.16.3/hadolint-Linux-x86_64 &&\
        chmod +x ./hadolint
		
lint:
	
	./hadolint Dockerfile
	pylint --disable=R,C,W1203,W1202, flask_app/app.py


all: install lint test

# run-app:
# 	python3 flask_app/app.py

# create-cluster:
# 	./create_cluster.sh

# k8s-deployment: create-cluster
# 	# If using minikube, first run: minikube start
# 	./k8s_deployment.sh

# k8s-cleanup-resources:
# 	./bin/k8s_cleanup_resources.sh

# eks-delete-cluster:
# 	./bin/eksctl delete cluster --name "${CLUSTER_NAME}" \
# 		--region "${REGION_NAME}"