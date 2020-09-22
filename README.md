# Machine Learning Pipeline

![Github CI](https://github.com/subaquatic-pierre/udacity-ml-pipeline-project/workflows/Github%20CI/badge.svg)

Machine Learning Pipeline - Final Project 2 for Udacity DevOps with Azure.

## Getting started

Before starting this project you should have the following:

- Azure account
- Azure DevOps organization
- Azure CLI

If you do not have these please follow the resources in the [Resources](#Resources) section to complete these actions and then come back to complete the walk-through

## Steps

All the commands a run using the Azure CLI

1. Clone this repo
2. Create resource group

```
   az group create --name NAME_OF_GROUP --location LOCATION_OF_GROUP
```

expected output:

```
{
  "id": "/subscriptions/{subscription-id}/resourceGroups/{name-of-group}",
  "location": "{location}",
  "managedBy": null,
  "name": "{name-of-group}",
  "properties": {
    "provisioningState": "Succeeded"
  },
  "tags": null,
  "type": "Microsoft.Resources/resourceGroups"
}
```

3. Create web app

```
   az webapp up --name NAME_OF_APP --g RESOURCE_GROUP_NAME
```

expected output:

```
The webapp '{app-name}' doesn't exist
Creating webapp '{app-name}' ...
Configuring default logging for the app, if not already enabled
Creating zip with contents of dir /home/pierre/Courses/DevOpsUdacity/Project_2 ...
Getting scm site credentials for zip deployment
Starting zip deployment. This operation can take a while to complete ...
Deployment endpoint responded with status code 202
You can launch the app at http://{app-name}.azurewebsites.net
{
  "URL": "http://{app-name}.azurewebsites.net",
  "appserviceplan": "{your-app-service-plan}",
  "location": "{location}",
  "name": "{app-name}",
  "os": "Linux",
  "resourcegroup": "{name-of-group}",
  "runtime_version": "python|3.7",
  "runtime_version_detected": "-",
  "sku": "PREMIUMV2",
  "src_path": "{your-source-path}"
}
```

4. Create new Azure DevOps project
5. Create new pipeline, select Github repo
6. Get service connection ID

```
   https://dev.azure.com/{organization}/{project}/_apis/serviceendpoint/endpoints?api-version=5.0-preview.2
```

7. Edit azure-pipelines.yml

```yaml
# Azure Resource Manager connection created during pipeline creation
azureServiceConnectionId: "NEED THIS"

# Web app name
webAppName: "{app-name}"

# Environment name
environmentName: "{app-name}"
```

8. Add all changes, commit and push to Github

```
git add .
git commit -m 'Completed pipeline configuration'
git push -u origin master
```

9. Check your application is working

```
https://{app-name}.azurewebsites.net
```

## Resources

#### Team Trello Board

All team members can use this Trello board to track project tasks.

- [Trello Board](https://trello.com/b/43FaIYZI/machine-learning-pipeline)

#### Project Plan

An excel sheet has been developed, in which all steps to the project are broken into weeks over the course of the next 3 months.

- [Project Plan](https://docs.google.com/spreadsheets/d/1zUXeUu7ceJ1TZbbRQ6UzTBJNdOCcpLiqsexRYvNkBF0/edit?usp=sharing)

#### Microsoft Azure walk-throughs

- [Create Python webapp with Azure](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops)
- [Setup Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/repos/github?view=azure-devops&tabs=yaml)
