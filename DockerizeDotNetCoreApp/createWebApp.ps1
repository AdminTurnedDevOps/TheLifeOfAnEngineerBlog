# For the Azure DevOps pipeline
param(
    [string]$RG,
    [string]$appPlanName,
    [string]$appName,
    [string]$dockerImage
)

az appservice plan create -g $RG -n $appPlanName --sku B1 --is-linux
az webapp create -g $RG -p $appPlanName -n $appName -i mjlreg.azurecr.io/ms/msweb2:latest