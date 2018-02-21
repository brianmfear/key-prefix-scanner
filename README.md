# Key Prefix Scanner

This is a simple Visualforce page and Lightning Component/Application that uses Id.getSObjectType to find key prefixes, including "hidden" object types.

## Getting Started

Simply clone this project to your local system.

### Prerequisites

You'll need a metadata tool to deploy this code. You can use Salesforce DX, the Metadata Toolkit, Developer Workbench, or any other tool that supports deploying metadata.

### Installing

Deploy this package to your org using any of several possible commands:

#### Automatic Deployment

Click the button below to automatically deploy the package to your org:

<a href="https://githubsfdeploy.herokuapp.com">
  <img alt="Deploy to Salesforce"
       src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/deploy.png">
</a>

#### sfdx

```
sfdx force:mdapi:deploy -d src -u <org-alias> -w -1
```

#### Metadata Toolkit

Update the [build.properties](build.properties) file with your Salesforce credentials, then run the following command:

```
ant deploy
```

#### Others

Consult your documentation.

## Authors

* **Brian Fear** - *Initial Work* - [brianmfear](https://github.com/brianmfear)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

* [FishOfPrey](https://github.com/FishOfPrey) for the original [blog post](http://www.fishofprey.com/2011/09/obscure-salesforce-object-key-prefixes.html) that inspired this project.
* [Andrew Fawcett](https://github.com/afawcett) for the awesome [GitHub Deployment Tool](https://github.com/afawcett/githubsfdeploy).
