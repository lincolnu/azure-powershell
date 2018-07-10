<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    Parameters that fully define a new cluster to be created.

.DESCRIPTION
    Parameters that fully define a new cluster to be created.

.PARAMETER PhysicalNodes
    The list of nodes.

.PARAMETER NetQosPriority
    QoS policy.

.PARAMETER TORSwitchBGPASN
    TOR switch ASN.

.PARAMETER TORSwitchBGPPeerIP
    TOR switch IP.

.PARAMETER InfrastructureNetwork
    

.PARAMETER SoftwareBGPASN
    Software ASN.

.PARAMETER StorageNetwork
    

#>
function New-CreateFromJsonParametersObject {
    param(    
        [Parameter(Mandatory = $false)]
        [Microsoft.AzureStack.Management.Fabric.Admin.Models.CreateScaleUnitFromJsonNodeParameters[]]
        $PhysicalNodes,
    
        [Parameter(Mandatory = $false)]
        [System.Nullable`1[long]]
        $NetQosPriority,
    
        [Parameter(Mandatory = $false)]
        [string]
        $TORSwitchBGPASN,
    
        [Parameter(Mandatory = $false)]
        [string[]]
        $TORSwitchBGPPeerIP,
    
        [Parameter(Mandatory = $false)]
        [Microsoft.AzureStack.Management.Fabric.Admin.Models.CreateScaleUnitFromJsonNetworkDefinition]
        $InfrastructureNetwork,
    
        [Parameter(Mandatory = $false)]
        [string]
        $SoftwareBGPASN,
    
        [Parameter(Mandatory = $false)]
        [Microsoft.AzureStack.Management.Fabric.Admin.Models.CreateScaleUnitFromJsonNetworkDefinition]
        $StorageNetwork
    )
    
    $Object = New-Object -TypeName Microsoft.AzureStack.Management.Fabric.Admin.Models.CreateFromJsonParameters -ArgumentList @($tORSwitchBGPASN, $softwareBGPASN, $tORSwitchBGPPeerIP, $infrastructureNetwork, $storageNetwork, $physicalNodes, $netQosPriority)

    if (Get-Member -InputObject $Object -Name Validate -MemberType Method) {
        $Object.Validate()
    }

    return $Object
}

