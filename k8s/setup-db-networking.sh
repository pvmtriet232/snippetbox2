#!/bin/bash
source ./config.txt
cat <<-EOF > db-subnet-groups.yaml
apiVersion: rds.services.k8s.aws/v1alpha1
kind: DBSubnetGroup
metadata:
  name: ${RDS_SUBNET_GROUP_NAME}
  namespace: ${APP_NAMESPACE}
spec:
  name: ${RDS_SUBNET_GROUP_NAME}
  description: ${RDS_SUBNET_GROUP_DESCRIPTION}
  subnetIDs: $(printf "    - %s\n" ${EKS_SUBNET_IDS})
  tags: []
EOF

kubectl apply -f db-subnet-groups.yaml
