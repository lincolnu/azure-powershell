<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS
    

.DESCRIPTION
    Create a scale unit.

.PARAMETER ScaleUnit
    Name of the scale units.

.PARAMETER Location
    Location of the resource.

.PARAMETER InputScaleUnitData
    The json content expected to describe a new cluster.

.PARAMETER PhysicalNodes
    The list of nodes.

.PARAMETER NetQosPriority
    QoS policy.

.PARAMETER TORSwitchBGPASN
    TOR switch ASN.

.PARAMETER TORSwitchBGPPeerIP
    TOR switch IP.

.PARAMETER InfrastructureNetworkVlanId
    Top level infrastructure IP subnet Vlan Id.

.PARAMETER InfrastructureNetworkSubnet
    Top level infrastructure IP subnet.

.PARAMETER SoftwareBGPASN
    Software ASN.

.PARAMETER StorageNetworkVlanId
    Top level storage IP subnet Vlan Id.

.PARAMETER StorageNetworkSubnet
    Top level storage IP subnet.

#>
function New-AzsScaleUnit {
    [CmdletBinding(DefaultParameterSetName = 'ScaleUnits_Create')]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'ScaleUnits_Create')]
        [System.String]
        $ScaleUnit,

        [Parameter(Mandatory = $true)]
        [Microsoft.AzureStack.Management.Fabric.Admin.Models.ScaleUnitNodeParameters[]]
        $PhysicalNodes,

        [Parameter(Mandatory = $true)]
        [System.Nullable`1[long]]
        $NetQosPriority,

        [Parameter(Mandatory = $true)]
        [string]
        $TORSwitchBGPASN,

        [Parameter(Mandatory = $true)]
        [string[]]
        $TORSwitchBGPPeerIP,

        [Parameter(Mandatory = $true)]
        [string[]]
        $InfrastructureNetworkVlanId,

        [Parameter(Mandatory = $true)]
        [string[]]
        $InfrastructureNetworkSubnet,

        [Parameter(Mandatory = $true)]
        [string]
        $SoftwareBGPASN,

        [Parameter(Mandatory = $true)]
        [string[]]
        $StorageNetworkVlanId,

        [Parameter(Mandatory = $true)]
        [string[]]
        $StorageNetworkSubnet,

        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnits_Create')]
        [System.String]
        $Location,

        [Parameter(Mandatory = $false)]
        [switch]
        $AsJob
    )

    Begin {
        Initialize-PSSwaggerDependencies -Azure
        $tracerObject = $null
        if (('continue' -eq $DebugPreference) -or ('inquire' -eq $DebugPreference)) {
            $oldDebugPreference = $global:DebugPreference
            $global:DebugPreference = "continue"
            $tracerObject = New-PSSwaggerClientTracing
            Register-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }

    Process {

        $InfrastructureNetwork = New-ScaleUnitNetworkDefinitionObject -VlanId $InfrastructureNetworkVlanId -Subnet $InfrastructureNetworkSubnet
        $StorageNetwork = New-ScaleUnitNetworkDefinitionObject -VlanId $StorageNetworkVlanId -Subnet $StorageNetworkSubnet

        $InputScaleUnitData = New-CreateScaleUnitParametersObject -PhysicalNodes $PhysicalNodes -NetQosPriority $NetQosPriority -SoftwareBGPASN $SoftwareBGPASN -TORSwitchBGPASN $TORSwitchBGPASN -TORSwitchBGPPeerIP $TORSwitchBGPPeerIP -InfrastructureNetwork $InfrastructureNetwork -StorageNetwork $StorageNetwork 

        $NewServiceClient_params = @{
            FullClientTypeName = 'Microsoft.AzureStack.Management.Fabric.Admin.FabricAdminClient'
        }

        $GlobalParameterHashtable = @{}
        $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable
     
        $GlobalParameterHashtable['SubscriptionId'] = $null
        if ($PSBoundParameters.ContainsKey('SubscriptionId')) {
            $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
        }

        $FabricAdminClient = New-ServiceClient @NewServiceClient_params

        if ([System.String]::IsNullOrEmpty($Location)) {
            $Location = (Get-AzureRMLocation).Location
        }

        if ('ScaleUnits_Create' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation CreateWithHttpMessagesAsync on $FabricAdminClient.'
            $TaskResult = $FabricAdminClient.ScaleUnits.CreateWithHttpMessagesAsync($Location, $ScaleUnit, $InputScaleUnitData)
        }
        else {
            Write-Verbose -Message 'Failed to map parameter set to operation method.'
            throw 'Module failed to find operation to execute.'
        }

        Write-Verbose -Message "Waiting for the operation to complete."

        $PSSwaggerJobScriptBlock = {
            [CmdletBinding()]
            param(
                [Parameter(Mandatory = $true)]
                [System.Threading.Tasks.Task]
                $TaskResult,

                [Parameter(Mandatory = $true)]
                [string]
                $TaskHelperFilePath
            )
            if ($TaskResult) {
                . $TaskHelperFilePath
                $GetTaskResult_params = @{
                    TaskResult = $TaskResult
                }
            
                Get-TaskResult @GetTaskResult_params
            
            }
        }

        $PSCommonParameters = Get-PSCommonParameter -CallerPSBoundParameters $PSBoundParameters
        $TaskHelperFilePath = Join-Path -Path $ExecutionContext.SessionState.Module.ModuleBase -ChildPath 'Get-TaskResult.ps1'
        if ($AsJob) {
            $ScriptBlockParameters = New-Object -TypeName 'System.Collections.Generic.Dictionary[string,object]'
            $ScriptBlockParameters['TaskResult'] = $TaskResult
            $ScriptBlockParameters['AsJob'] = $AsJob
            $ScriptBlockParameters['TaskHelperFilePath'] = $TaskHelperFilePath
            $PSCommonParameters.GetEnumerator() | ForEach-Object { $ScriptBlockParameters[$_.Name] = $_.Value }

            Start-PSSwaggerJobHelper -ScriptBlock $PSSwaggerJobScriptBlock `
                -CallerPSBoundParameters $ScriptBlockParameters `
                -CallerPSCmdlet $PSCmdlet `
                @PSCommonParameters
        }
        else {
            Invoke-Command -ScriptBlock $PSSwaggerJobScriptBlock `
                -ArgumentList $TaskResult, $TaskHelperFilePath `
                @PSCommonParameters
        }
    }

    End {
        if ($tracerObject) {
            $global:DebugPreference = $oldDebugPreference
            Unregister-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }
}

