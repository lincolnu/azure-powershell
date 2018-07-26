
$rpName = "fabric"
$name = "Fabric"
$location = Get-Location
$psswagger = "D:\ghrepos\PSSwagger"
$module = "TestModule"
$namespace = "Microsoft.AzureStack.Management.$Name.Admin"
$assembly = "$namespace.dll"
$client = "$namespace.$($name)AdminClient"


. ..\..\..\tools\GeneratePSSwagger.ps1 `
    -RPName $rpName `
    -Location $location `
    -Admin `
    -ModuleDirectory $module `
    -AzureStack `
    -PSSwaggerLocation $psswagger `
    -GithubAccount lincolnu `
    -GithubBranch users/lincolnu/addnodeandscaleunit `
    -PredefinedAssemblies $assembly `
    -Name $name `
    -ClientTypeName $client `
    -GenerateSwagger:$true
