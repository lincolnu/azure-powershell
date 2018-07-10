<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Input data that allows for adding a scale unit node.

.DESCRIPTION
    Input data that allows for adding a scale unit node.

.PARAMETER Name
    Computer name of the physical machine.

.PARAMETER BMCIPAddress
    Bmc address of the physical machine.

#>
function New-CreateScaleUnitFromJsonNodeParametersObject {
    param(    
        [Parameter(Mandatory = $false)]
        [string]
        $Name,
    
        [Parameter(Mandatory = $false)]
        [string]
        $BMCIPAddress
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Management.Fabric.Admin.Models.CreateScaleUnitFromJsonNodeParameters -ArgumentList @($name, $bMCIPAddress)

    if (Get-Member -InputObject $Object -Name Validate -MemberType Method) {
        $Object.Validate()
    }

    return $Object
}

