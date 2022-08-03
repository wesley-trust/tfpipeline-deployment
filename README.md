# tfpipeline-deployment
Terraform root configuration for deploying Pipelines to Azure DevOps, with Terratest Unit/Integration testing via Go and Regula (OPA) Policy as Code scanning in an Azure DevOps Pipeline
## [CI/CD Pipeline](https://dev.azure.com/wesleytrust/Terraform/_build?definitionId=81)
Select a stage to view in Azure DevOps. *Note that 'Skipped' stages in the last run, will show as "unknown" by design.*
| Pipeline |
| :------: |
|     [![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/DeploymentServices/ENV-P%3B%20tfpipeline-deployment?repoName=wesley-trust%2Ftfpipeline-deployment&branchName=main)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=81&repoName=wesley-trust%2Ftfpipeline-deployment&branchName=main)     |
### Testing Stages
| Unit Tests | Integration Tests |
| :--------: | :---------------: |
|   [![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/DeploymentServices/ENV-P%3B%20tfpipeline-deployment?repoName=wesley-trust%2Ftfpipeline-deployment&branchName=main&stageName=Unit)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=81&repoName=wesley-trust%2Ftfpipeline-deployment&branchName=main)         |         [![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/DeploymentServices/ENV-P%3B%20tfpipeline-deployment?repoName=wesley-trust%2Ftfpipeline-deployment&branchName=main&stageName=Integration)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=81&repoName=wesley-trust%2Ftfpipeline-deployment&branchName=main)          |
### Deployment Stages
| Plan  | Apply |
| :---: | :---: |
|   [![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/DeploymentServices/ENV-P%3B%20tfpipeline-deployment?repoName=wesley-trust%2Ftfpipeline-deployment&branchName=main&stageName=Plan)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=81&repoName=wesley-trust%2Ftfpipeline-deployment&branchName=main)    |   [![Build Status](https://dev.azure.com/wesleytrust/Terraform/_apis/build/status/DeploymentServices/ENV-P%3B%20tfpipeline-deployment?repoName=wesley-trust%2Ftfpipeline-deployment&branchName=main&stageName=Apply)](https://dev.azure.com/wesleytrust/Terraform/_build/latest?definitionId=81&repoName=wesley-trust%2Ftfpipeline-deployment&branchName=main)    |