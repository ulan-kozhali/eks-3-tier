#!/bin/bash
aws eks update-kubeconfig --region us-east-1 --name demo
# curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
# sudo mv /tmp/eksctl /usr/local/bin
# eksctl utils associate-iam-oidc-provider --region=us-east-1 --cluster=demo --approve
# eksctl create iamserviceaccount \
#   --region us-east-1 \
#   --name ebs-csi-controller-sa \
#   --namespace kube-system \
#   --cluster demo \
#   --attach-policy-arn arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy \
#   --approve \
#   --role-only \
#   --role-name AmazonEKS_EBS_CSI_DriverRole
# eksctl create addon --name aws-ebs-csi-driver --cluster demo --service-account-role-arn arn:aws:iam::$(aws sts get-caller-identity --query Account --output text):role/AmazonEKS_EBS_CSI_DriverRole --force
kubectl apply -f https://raw.githubusercontent.com/rancher/local-path-provisioner/v0.0.30/deploy/local-path-storage.yaml
kubectl annotate storageclass local-path storageclass.kubernetes.io/is-default-class=true
cd helm 
terraform init
terraform apply