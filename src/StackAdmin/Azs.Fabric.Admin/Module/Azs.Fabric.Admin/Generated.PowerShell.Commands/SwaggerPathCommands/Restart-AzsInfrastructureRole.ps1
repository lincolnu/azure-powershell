<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS


.DESCRIPTION
    Restarts the requestd infrastructure role.

.PARAMETER ResourceGroupName
    Name of the resource group.

.PARAMETER InfraRole
    Infrastructure role name.

.PARAMETER Location
    Location of the resource.

.PARAMETER ResourceId
    Infrastructure role resource ID.

.PARAMETER InputObject
    Infrastructure role object.

#>
function Restart-AzsInfrastructureRole
{
    [CmdletBinding(DefaultParameterSetName = 'InfraRoles_Restart')]
    param(
        [Parameter(Mandatory = $true, ParameterSetName = 'InfraRoles_Restart')]
        [System.String]
        $ResourceGroupName,

        [Parameter(Mandatory = $true, ParameterSetName = 'InfraRoles_Restart')]
        [System.String]
        $InfraRole,

        [Parameter(Mandatory = $true, ParameterSetName = 'InfraRoles_Restart')]
        [System.String]
        $Location,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_InfraRoles')]
        [System.String]
        $ResourceId,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_InfraRoles')]
        [Microsoft.AzureStack.Management.Fabric.Admin.Models.InfraRole]
        $InputObject,

        [Parameter(Mandatory = $false)]
        [switch]
        $AsJob
    )

    Begin
    {
        Initialize-PSSwaggerDependencies -Azure
        $tracerObject = $null
        if (('continue' -eq $DebugPreference) -or ('inquire' -eq $DebugPreference))
        {
            $oldDebugPreference = $global:DebugPreference
            $global:DebugPreference = "continue"
            $tracerObject = New-PSSwaggerClientTracing
            Register-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }

    Process
    {

        $ErrorActionPreference = 'Stop'

        $NewServiceClient_params = @{
            FullClientTypeName = 'Microsoft.AzureStack.Management.Fabric.Admin.FabricAdminClient'
        }

        $GlobalParameterHashtable = @{}
        $NewServiceClient_params['GlobalParameterHashtable'] = $GlobalParameterHashtable

        $GlobalParameterHashtable['SubscriptionId'] = $null
        if ($PSBoundParameters.ContainsKey('SubscriptionId'))
        {
            $GlobalParameterHashtable['SubscriptionId'] = $PSBoundParameters['SubscriptionId']
        }

        $FabricAdminClient = New-ServiceClient @NewServiceClient_params

        if ('InputObject_InfraRoles' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_InfraRoles' -eq $PsCmdlet.ParameterSetName)
        {
            $GetArmResourceIdParameterValue_params = @{
                IdTemplate = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Fabric.Admin/fabricLocations/{location}/infraRoles/{infraRole}'
            }

            if ('ResourceId_InfraRoles' -eq $PsCmdlet.ParameterSetName)
            {
                $GetArmResourceIdParameterValue_params['Id'] = $ResourceId
            }
            else
            {
                $GetArmResourceIdParameterValue_params['Id'] = $InputObject.Id
            }
            $ArmResourceIdParameterValues = Get-ArmResourceIdParameterValue @GetArmResourceIdParameterValue_params

            $resourceGroupName = $ArmResourceIdParameterValues['resourceGroupName']
            $location = $ArmResourceIdParameterValues['location']
            $InfraRole = $ArmResourceIdParameterValues['infraRole']
        }

        if ('InfraRoles_Restart' -eq $PsCmdlet.ParameterSetName -or 'InputObject_InfraRoles' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_InfraRoles' -eq $PsCmdlet.ParameterSetName)
        {
            Write-Verbose -Message 'Performing operation RestartWithHttpMessagesAsync on $FabricAdminClient.'
            $TaskResult = $FabricAdminClient.InfraRoles.RestartWithHttpMessagesAsync($ResourceGroupName, $Location, $InfraRole)
        }
        else
        {
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
            if ($TaskResult)
            {
                . $TaskHelperFilePath
                $GetTaskResult_params = @{
                    TaskResult = $TaskResult
                }

                Get-TaskResult @GetTaskResult_params

            }
        }

        $PSCommonParameters = Get-PSCommonParameter -CallerPSBoundParameters $PSBoundParameters
        $TaskHelperFilePath = Join-Path -Path $ExecutionContext.SessionState.Module.ModuleBase -ChildPath 'Get-TaskResult.ps1'
        if ($AsJob)
        {
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
        else
        {
            Invoke-Command -ScriptBlock $PSSwaggerJobScriptBlock `
                -ArgumentList $TaskResult, $TaskHelperFilePath `
                @PSCommonParameters
        }
    }

    End
    {
        if ($tracerObject)
        {
            $global:DebugPreference = $oldDebugPreference
            Unregister-PSSwaggerClientTracing -TracerObject $tracerObject
        }
    }
}

