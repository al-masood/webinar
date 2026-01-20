helm install kubedb oci://ghcr.io/appscode-charts/kubedb \
  --version v2026.1.19 \
  --namespace kubedb --create-namespace \
  --set-file global.license=/home/ubuntu/kubedb-license-1910179a-40aa-4daf-a9be-e2b03db53a4a.txt \
  --set global.featureGates.Qdrant=true \
  --wait --burst-limit=10000 --debug
