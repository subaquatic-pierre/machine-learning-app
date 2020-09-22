# Machine Learning Pipeline

![Github CI](https://github.com/subaquatic-pierre/machine-learning-app/workflows/Github%20CI/badge.svg)
[![Build Status](https://dev.azure.com/subaquaticpierre/machine-learning-app/_apis/build/status/subaquatic-pierre.udacity-ml-pipeline-project?branchName=master)](https://dev.azure.com/subaquaticpierre/machine-learning-app/_build/latest?definitionId=4&branchName=master)

Machine Learning Pipeline - Final Project 2 for Udacity DevOps with Azure.

[Application URL](https://machine-learning-app.azurewebsites.net)

Welcome to the Machine Learning Pipeline. This project is used to create a machine learning pipeline which runs on Microsoft Azure. The application is hosted with an application service. All changes to source code are pushed to Github. Once changes have been pushed it triggers the pipeline. The first step in the pipeline is integration testing with Github actions. Once the integration testing is complete the project is shipped to the continuous delivery system in Azure. Once the tests are passed with application is uploaded to the web application.

The web app itself serves as a machine learning API, it determines the price on Boston house based on a machine learning model derived from data, which includes number of rooms, teaches to pupil ratios, size of the house and many data points.

## Getting started

Before starting this project you should have the following:

- Azure account
- Azure DevOps organization
- Azure CLI

If you do not have these please follow the Microsoft Azure walk-through in the [Resources](#Resources) section to complete these steps.

## Diagram

<img src='/screenshots/diagram.png'/>

## Steps

All the commands are run using the Azure CLI

1. Clone this repo, and CD into directory

```
git clone git@github.com:subaquatic-pierre/machine-learning-app.git
cd machine-learning-app
```

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
6. Create Service Connection

```
https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops#create-an-azure-devops-project-and-connect-to-azure
```

7. Get service connection ID

```

https://dev.azure.com/{organization}/{project}/_apis/serviceendpoint/endpoints?api-version=5.0-preview.2

```

expected output:

```json
{
   count: 2,
   value: [
      {
         data: {
            ...
            pipelinesSourceProvider: "github",
            ...
            },
         data: {
            environment: "AzureCloud",
            ...
            },
            id: "78a428c7-5e33-43e0-a4b9-93a9d8e61c3a",
            ...
         },
   ],
}
```

8. Edit azure-pipelines.yml

```yaml
# Azure Resource Manager connection created during pipeline creation
azureServiceConnectionId: "{app-service-connection-id}"

# Web app name
webAppName: "{app-name}"

# Environment name
environmentName: "{app-name}"
```

9. Add all changes, commit and push to Github

```
git add .
git commit -m 'Completed pipeline configuration'
git push -u origin master
```

10. Check your application is working

```
https://{app-name}.azurewebsites.net

```

## Output

Once you have completed this walk-through you will have a fully functioning machine learning pipeline which handles requests over the internet. The program returns JSON format string determine prices of houses in Boston based on machine learning algorithm.

You will have a fully integrated pipeline which includes continuous integration step with Github actions, which performs linting and testing before the code is sent to the continuous development stage with the use of Azure pipelines.

To access to application log files follow this link, add the name of your app

```
   https://<app-name>.scm.azurewebsites.net/api/logs/docker
```

## Enhancements

The road map for the future of the project will include the following features

- More house pricing models for more cities
- User interface for selecting more cities
- Admin interface for creating more cities
- User profile to store searches
- Add more data points to the dataset

## Resources

#### Team Trello Board

All team members can use this Trello board to track project tasks.

- [Trello Board](https://trello.com/b/43FaIYZI/machine-learning-pipeline)

#### Project Plan

An excel sheet has been developed, in which all steps to the project are broken into weeks over the course of the next 3 months.

- [Project Plan](https://docs.google.com/spreadsheets/d/1zUXeUu7ceJ1TZbbRQ6UzTBJNdOCcpLiqsexRYvNkBF0/edit?usp=sharing)

#### Microsoft Azure walk-through

- [Create Python webapp with Azure](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops)
- [Setup Azure Pipelines](https://docs.microsoft.com/en-us/azure/devops/pipelines/repos/github?view=azure-devops&tabs=yaml)
