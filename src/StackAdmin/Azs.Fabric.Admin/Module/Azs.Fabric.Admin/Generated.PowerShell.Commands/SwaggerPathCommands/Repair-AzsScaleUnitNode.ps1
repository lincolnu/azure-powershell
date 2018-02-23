<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS


.DESCRIPTION
    Repairs a node of the cluster.

.PARAMETER BiosVersion
    Bios version of the physical machine.

.PARAMETER BMCIPv4Address
    BMC address of the physical machine.

.PARAMETER Model
    Model of the physical machine.

.PARAMETER SerialNumber
    Serial number of the physical machine.

.PARAMETER MacAddress
    Name of the MAC address of the bare metal node.

.PARAMETER Vendor
    Vendor of the physical machine.

.PARAMETER ResourceGroupName
    Name of the resource group.

.PARAMETER ScaleUnitNode
    Name of the scale unit node.

.PARAMETER ComputerName
    Name of the computer.

.PARAMETER Location
    Location of the resource.

.PARAMETER ClusterName
    Name of the cluster.

.PARAMETER InputObject
    Scale unit node object.

.PARAMETER ResourceId
    Scale unit node resource ID.

#>
function Repair-AzsScaleUnitNode {
    [CmdletBinding(DefaultParameterSetName = 'ScaleUnitNodes_Repair')]
    param(
        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnitNodes_Repair')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject_ScaleUnitNodes')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_ScaleUnitNodes')]
        [string]
        $BiosVersion,

        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnitNodes_Repair')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject_ScaleUnitNodes')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_ScaleUnitNodes')]
        [string]
        $BMCIPv4Address,

        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnitNodes_Repair')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject_ScaleUnitNodes')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_ScaleUnitNodes')]
        [string]
        $Model,

        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnitNodes_Repair')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject_ScaleUnitNodes')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_ScaleUnitNodes')]
        [string]
        $SerialNumber,

        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnitNodes_Repair')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject_ScaleUnitNodes')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_ScaleUnitNodes')]
        [string]
        $MacAddress,

        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnitNodes_Repair')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject_ScaleUnitNodes')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_ScaleUnitNodes')]
        [string]
        $Vendor,

        [Parameter(Mandatory = $true, ParameterSetName = 'ScaleUnitNodes_Repair')]
        [System.String]
        $ResourceGroupName,

        [Parameter(Mandatory = $true, ParameterSetName = 'ScaleUnitNodes_Repair')]
        [System.String]
        $ScaleUnitNode,

        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnitNodes_Repair')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject_ScaleUnitNodes')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_ScaleUnitNodes')]
        [string]
        $ComputerName,

        [Parameter(Mandatory = $true, ParameterSetName = 'ScaleUnitNodes_Repair')]
        [System.String]
        $Location,

        [Parameter(Mandatory = $false, ParameterSetName = 'ScaleUnitNodes_Repair')]
        [Parameter(Mandatory = $false, ParameterSetName = 'InputObject_ScaleUnitNodes')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_ScaleUnitNodes')]
        [string]
        $ClusterName,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_ScaleUnitNodes')]
        [Microsoft.AzureStack.Management.Fabric.Admin.Models.ScaleUnitNode]
        $InputObject,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_ScaleUnitNodes')]
        [System.String]
        $ResourceId,

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

        $ErrorActionPreference = 'Stop'

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


        $flattenedParameters = @('SerialNumber', 'BiosVersion', 'ClusterName', 'ComputerName', 'MacAddress', 'Model', 'BMCIPv4Address', 'Vendor')
        $utilityCmdParams = @{}
        $flattenedParameters | ForEach-Object {
            if ($PSBoundParameters.ContainsKey($_)) {
                $utilityCmdParams[$_] = $PSBoundParameters[$_]
            }
        }
        $BareMetalNode = New-BareMetalNodeDescriptionObject @utilityCmdParams

        if ('InputObject_ScaleUnitNodes' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_ScaleUnitNodes' -eq $PsCmdlet.ParameterSetName)
        {
            $GetArmResourceIdParameterValue_params = @{
                IdTemplate = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Fabric.Admin/fabricLocations/{location}/scaleUnitNodes/{scaleUnitNode}'
            }

            if ('ResourceId_ScaleUnitNodes' -eq $PsCmdlet.ParameterSetName)
            {
                $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
            }
            else
            {
                $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
            }

            $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params

            $ResourceGroupName = $ArmResourceIdParameterValues['resourceGroupName']
            $Location = $ArmResourceIdParameterValues['location']
            $ScaleUnitNode = $ArmResourceIdParameterValues['scaleUnitNode']
        }

        if ('ScaleUnitNodes_Repair' -eq $PsCmdlet.ParameterSetName -or 'InputObject_ScaleUnitNodes' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_ScaleUnitNodes' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation RepairWithHttpMessagesAsync on $FabricAdminClient.'
            $TaskResult = $FabricAdminClient.ScaleUnitNodes.RepairWithHttpMessagesAsync($ResourceGroupName, $Location, $ScaleUnitNode, $BareMetalNode)
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

