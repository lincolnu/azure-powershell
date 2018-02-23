<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS


.DESCRIPTION
    Shutdown a scale unit node.

.PARAMETER ScaleUnitNode
    Name of the scale unit node.

.PARAMETER ResourceGroupName
    Name of the resource group.

.PARAMETER Location
    Location of the resource.

.PARAMETER InputObject
    Scale unit node object.

.PARAMETER ResourceId
    Scale unit node resource ID.

#>
function Submit-AzsScaleUnitNodeShutdown {
    [CmdletBinding(DefaultParameterSetName = 'ScaleUnitNodes_Shutdown')]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'ScaleUnitNodes_Shutdown')]
        [System.String]
        $ScaleUnitNode,

        [Parameter(Mandatory = $true, ParameterSetName = 'ScaleUnitNodes_Shutdown')]
        [System.String]
        $ResourceGroupName,

        [Parameter(Mandatory = $true, ParameterSetName = 'ScaleUnitNodes_Shutdown')]
        [System.String]
        $Location,

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

        if ('ScaleUnitNodes_Shutdown' -eq $PsCmdlet.ParameterSetName -or 'InputObject_ScaleUnitNodes' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_ScaleUnitNodes' -eq $PsCmdlet.ParameterSetName) {
            Write-Verbose -Message 'Performing operation ShutdownWithHttpMessagesAsync on $FabricAdminClient.'
            $TaskResult = $FabricAdminClient.ScaleUnitNodes.ShutdownWithHttpMessagesAsync($ResourceGroupName, $Location, $ScaleUnitNode)
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

