<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    A list of input data that allows for adding a set of scale unit nodes.

.DESCRIPTION
    A list of input data that allows for adding a set of scale unit nodes.

.PARAMETER NodeList
    List of nodes in the scale unit.

.PARAMETER AwaitStorageConvergence
    Flag indicates if the operation should wait for storage to converge before returning.

#>
function New-ScaleOutScaleUnitParametersListObject {
    param(    
        [Parameter(Mandatory = $false)]
        [Microsoft.AzureStack.Management.Fabric.Admin.Models.ScaleOutScaleUnitParameters[]]
        $NodeList,
    
        [Parameter(Mandatory = $false)]
        [switch]
        $AwaitStorageConvergence
    )
    $awaitStorageConvergenceValue = if ($PSBoundParameters.ContainsKey('awaitStorageConvergence')) { $awaitStorageConvergence } else { $null }

    $Object = New-Object -TypeName Microsoft.AzureStack.Management.Fabric.Admin.Models.ScaleOutScaleUnitParametersList -ArgumentList @($nodeList, $awaitStorageConvergenceValue)

    if (Get-Member -InputObject $Object -Name Validate -MemberType Method) {
        $Object.Validate()
    }

    return $Object
}

