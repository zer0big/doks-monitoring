##!/usr/bin/env bash
### change to your desired values
LOCATION="koreacentral" 
RG_NAME="zerohorg"
CLUSTER_NAME="zeroaksdemo"
NODE_SIZE="Standard_D2s_v3"
NODE_COUNT="2"
NODE_DISK_SIZE="30"
###

### create the cluster
#az login
#VERSION=1.14.8
VERSION=$(az aks get-versions -l $LOCATION --query 'orchestrators[-1].orchestratorVersion' -o tsv)
az group create --name $RG_NAME --location $LOCATION
az aks create --resource-group $RG_NAME --name $CLUSTER_NAME \
  --kubernetes-version $VERSION \
  --location $LOCATION \
  --node-vm-size $NODE_SIZE \
  --node-count $NODE_COUNT --node-osdisk-size $NODE_DISK_SIZE

# connect to the cluster
az aks get-credentials --resource-group $RG_NAME --name $CLUSTER_NAME

# verify the cluster
kubectl get nodes
