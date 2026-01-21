kubectl get -n demo secret qdrant-distributed-auth -o jsonpath='{.data}' | jq -r 'to_entries[] | "\(.key): \(.value | @base64d)"'

curl -X GET "http://localhost:6333/cluster" \
  -H "Content-Type: application/json" \
  -H "api-key: jfRgjh6QOdz13y7O"


curl -X PUT "http://localhost:6333/collections/my_collection" \
  -H "Content-Type: application/json" \
  -H "api-key: jfRgjh6QOdz13y7O" \
  -d '{
    "vectors": {
      "size": 5,
      "distance": "Cosine"
    },
    "shard_number": 6,
    "replication_factor": 4
  }'

curl -X PUT "http://localhost:6333/collections/my_collection/points" \
  -H "Content-Type: application/json" \
  -H "api-key: jfRgjh6QOdz13y7O" \
  -d '{
    "points": [
      {
        "id": 1,
        "vector": [0.01, 0.02, 0.03, 0.04, 0.05]
      }
    ]
  }'

kubectl get secret qdrant-standalone-tls-client-cert -n demo \
                                                                    -o jsonpath='{.data.ca\.crt}' | base64 -d > ca.crt

                                                              kubectl get secret qdrant-standalone-tls-client-cert -n demo \
                                                                    -o jsonpath='{.data.tls\.crt}' | base64 -d > tls.crt

                                                              kubectl get secret qdrant-standalone-tls-client-cert -n demo \
                                                                    -o jsonpath='{.data.tls\.key}' | base64 -d > tls.key


curl -v --cacert ca.crt --cert tls.crt --key tls.key https://localhost:6333/readyz
