<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Input data that allows for adding a scale unit node.

.DESCRIPTION
    Input data that allows for adding a scale unit node.

.PARAMETER VlanId
    Top level storage IP subnet Vlan Id.

.PARAMETER Subnet
    Top level storage IP subnet.

#>
function New-CreateScaleUnitFromJsonNetworkDefinitionObject {
    param(    
        [Parameter(Mandatory = $false)]
        [string[]]
        $VlanId,
    
        [Parameter(Mandatory = $false)]
        [string[]]
        $Subnet
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Management.Fabric.Admin.Models.CreateScaleUnitFromJsonNetworkDefinition -ArgumentList @($subnet, $vlanId)

    if (Get-Member -InputObject $Object -Name Validate -MemberType Method) {
        $Object.Validate()
    }

    return $Object
}

