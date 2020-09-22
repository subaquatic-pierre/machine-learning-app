# Machine Learning Pipeline

![Github CI](https://github.com/subaquatic-pierre/udacity-ml-pipeline-project/workflows/Github%20CI/badge.svg)

Machine Learning Pipeline - Final Project 2 for Udacity DevOps with Azure.

## Steps

1. Clone this repo
2. Create resource group

   az group create --name NAME_OF_GROUP --location LOCATION_OF_GROUP

3. Create web app

   az webapp up --name NAME_OF_APP --g RESOURCE_GROUP_NAME

4. Create new Azure DevOps project
5. Create new pipeline, select Github repo
6. Edit azure-pipelines.yml

```yaml
# Azure Resource Manager connection created during pipeline creation
azureServiceConnectionId: "NEED THIS"

# Web app name
webAppName: "machine-learning-app"

# Environment name
environmentName: "machine-learning-app"
```

## Resources

#### Team Trello Board

All team members can use this Trello board to track project tasks.

- [Trello Board](https://trello.com/b/43FaIYZI/machine-learning-pipeline)

#### Project Plan

An excel sheet has been developed, in which all steps to the project are broken into weeks over the course of the next 3 months.

- [Project Plan](https://docs.google.com/spreadsheets/d/1zUXeUu7ceJ1TZbbRQ6UzTBJNdOCcpLiqsexRYvNkBF0/edit?usp=sharing)

## Notes

How to get the Application service connection ID

https://dev.azure.com/{organization}/{project}/_apis/serviceendpoint/endpoints?api-version=5.0-preview.2
