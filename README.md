An example of how to use modules in Bicep to deploy resources into separate scopes from the same template.


To deploy this, connect to Azure from Powershell and run this:

```new-azdeployment -name $((new-guid).guid) -Location westus2 -TemplateFile main.bicep -Verbose```
