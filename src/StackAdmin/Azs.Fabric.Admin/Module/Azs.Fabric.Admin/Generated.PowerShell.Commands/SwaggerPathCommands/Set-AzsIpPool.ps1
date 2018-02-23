<#
Copyright (c) Microsoft Corporation. All rights reserved.
Licensed under the MIT License. See License.txt in the project root for license information.
#>

<#
.SYNOPSIS


.DESCRIPTION
    Create an IP pool.  Once created an IP pool cannot be deleted.

.PARAMETER EndIpAddress
    The ending IP address.

.PARAMETER NumberOfIpAddresses
    The total number of IP addresses.

.PARAMETER Type
    Type of resource.

.PARAMETER Name
    Name of the resource.

.PARAMETER ResourceId
    The resource id.

.PARAMETER InputObject
    The input object of type Microsoft.AzureStack.Management.Fabric.Admin.Models.IpPool.

.PARAMETER AddressPrefix
    The address prefix.

.PARAMETER StartIpAddress
    The starting IP address.

.PARAMETER NumberOfIpAddressesInTransition
    The current number of IP addresses in transition.

.PARAMETER Name
    IP pool name.

.PARAMETER Tags
    List of key-value pairs.

.PARAMETER ResourceGroupName
    Name of the resource group.

.PARAMETER Id
    URI of the resource.

.PARAMETER Location
    The region where the resource is located.

.PARAMETER NumberOfAllocatedIpAddresses
    The number of currently allocated IP addresses.

.PARAMETER InputObject
    IP pool object.

.PARAMETER ResourceId
    IP pool resource ID.

#>
function Set-AzsIpPool
{
    [OutputType([Microsoft.AzureStack.Management.Fabric.Admin.Models.ProvisioningState])]
    [CmdletBinding(DefaultParameterSetName = 'IpPools_Update')]
    param(
        [Parameter(Mandatory = $false, ParameterSetName = 'IpPools_Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_IpPools_Update')]
        [string]
        $EndIpAddress,

        [Parameter(Mandatory = $false, ParameterSetName = 'IpPools_Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_IpPools_Update')]
        [int64]
        $NumberOfIpAddresses,

        [Parameter(Mandatory = $true, ValueFromPipelineByPropertyName = $true, ParameterSetName = 'ResourceId_IpPools_Update')]
        [System.String]
        $ResourceId,

        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'InputObject_IpPools_Update')]
        [Microsoft.AzureStack.Management.Fabric.Admin.Models.IpPool]
        $InputObject,

        [Parameter(Mandatory = $false, ParameterSetName = 'IpPools_Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_IpPools_Update')]
        [string]
        $AddressPrefix,

        [Parameter(Mandatory = $false, ParameterSetName = 'IpPools_Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_IpPools_Update')]
        [string]
        $StartIpAddress,

        [Parameter(Mandatory = $false, ParameterSetName = 'IpPools_Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_IpPools_Update')]
        [int64]
        $NumberOfIpAddressesInTransition,

        [Parameter(Mandatory = $true, ParameterSetName = 'IpPools_Update')]
        [Alias('IpPool')]
        [System.String]
        $Name,

        [Parameter(Mandatory = $false, ParameterSetName = 'IpPools_Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_IpPools_Update')]
        [System.Collections.Generic.Dictionary[[string], [string]]]
        $Tags,

        [Parameter(Mandatory = $true, ParameterSetName = 'IpPools_Update')]
        [System.String]
        $ResourceGroupName,

        [Parameter(Mandatory = $true, ParameterSetName = 'IpPools_Update')]
        [string]
        $Location,

        [Parameter(Mandatory = $false, ParameterSetName = 'IpPools_Update')]
        [Parameter(Mandatory = $false, ParameterSetName = 'ResourceId_IpPools_Update')]
        [int64]
        $NumberOfAllocatedIpAddresses,

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

        $IpPool = $Name

        if (('InputObject_IpPools_Update' -eq $PsCmdlet.ParameterSetName) -or ('ResourceId_IpPools_Update' -eq $PsCmdlet.ParameterSetName))
        {
            $GetArmResourceIdParameterValue_params = @{
                IdTemplate = '/subscriptions/{subscriptionId}/resourceGroups/{resourceGroupName}/providers/Microsoft.Fabric.Admin/fabricLocations/{location}/ipPools/{ipPool}'
            }

            if ('ResourceId_IpPools_Update' -eq $PsCmdlet.ParameterSetName)
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
            $IpPool = $ArmResourceIdParameterValues['ipPool']
        }


        if ('IpPools_Update' -eq $PsCmdlet.ParameterSetName -or 'InputObject_IpPools_Update' -eq $PsCmdlet.ParameterSetName -or 'ResourceId_IpPools_Update' -eq $PsCmdlet.ParameterSetName)
        {
            # Update only the parameters with values
            if ($Pool -eq $null)
            {
                # Update pool with new values
                $Pool = Get-AzsIpPool -ResourceGroupName $ResourceGroupName -Location $Location -Name $Name
                $flattenedParameters = @('NumberOfIpAddressesInTransition', 'StartIpAddress', 'Tags', 'AddressPrefix', 'NumberOfIpAddresses', 'EndIpAddress', 'NumberOfAllocatedIpAddresses')
                $flattenedParameters | ForEach-Object {
                    if ($PSBoundParameters.ContainsKey($_))
                    {
                        $Pool.$_ = $PSBoundParameters[$_]
                    }
                }
            }
            Write-Verbose -Message 'Performing operation CreateOrUpdateWithHttpMessagesAsync on $FabricAdminClient.'
            $TaskResult = $FabricAdminClient.IpPools.CreateOrUpdateWithHttpMessagesAsync($ResourceGroupName, $Location, $IpPool, $Pool)
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

