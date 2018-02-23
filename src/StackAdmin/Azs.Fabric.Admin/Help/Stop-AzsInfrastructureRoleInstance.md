---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Stop-AzsInfrastructureRoleInstance

## SYNOPSIS
Power off an infrastructure role instance. On failure an exception is thrown.

## SYNTAX

### InfraRoleInstances_PowerOff (Default)
```
Stop-AzsInfrastructureRoleInstance -InfraRoleInstance <String> -ResourceGroupName <String> -Location <String>
 [-AsJob] [<CommonParameters>]
```

### InputObject_InfraRoleInstances_Stop
```
Stop-AzsInfrastructureRoleInstance -InputObject <InfraRoleInstance> [-AsJob] [<CommonParameters>]
```

### ResourceId_InfraRoleInstances_Stop
```
Stop-AzsInfrastructureRoleInstance -ResourceId <String> [-AsJob] [<CommonParameters>]
```

## DESCRIPTION
Power off an infrastructure role instance. On failure an exception is thrown.

## EXAMPLES

### Example 1
```
PS C:\> Stop-AzsInfrastructureRoleInstancef ResourceGroup "System.local" -Location "local" -InfrastructureRoleInstance "AzS-ACS01"

ProvisioningState
-----------------
Succeeded
```

Power off a infrastructure role instance.

## PARAMETERS

### -AsJob
Runs as job.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -InfraRoleInstance
Name of an infrastructure role instance.```yaml
Type: String
Parameter Sets: InfraRoleInstances_PowerOff
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Infrastructure role instance object.```yaml
Type: InfraRoleInstance
Parameter Sets: InputObject_InfraRoleInstances_Stop
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Location
Location of the resource.

```yaml
Type: String
Parameter Sets: InfraRoleInstances_PowerOff
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
Name of the resource group.```yaml
Type: String
Parameter Sets: InfraRoleInstances_PowerOff
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceId
Infrastructure role instance resource ID.```yaml
Type: String
Parameter Sets: ResourceId_InfraRoleInstances_Stop
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### Microsoft.AzureStack.Management.Fabric.Admin.Models.OperationStatus

## NOTES

## RELATED LINKS

