#Cert Manager
kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.19.2/cert-manager.yaml

# Generate CA certificate
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ./ca.key -out ./ca.crt -subj "/CN=qdrant/O=kubedb"

# Create CA secret
kubectl create secret tls qdrant-ca \
    --cert=ca.crt \
    --key=ca.key \
    --namespace=demo
