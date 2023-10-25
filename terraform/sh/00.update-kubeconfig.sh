CLUSTER_NAME=jaintest
aws eks update-kubeconfig --region ap-northeast-2 --name $CLUSTER_NAME --alias $CLUSTER_NAME
