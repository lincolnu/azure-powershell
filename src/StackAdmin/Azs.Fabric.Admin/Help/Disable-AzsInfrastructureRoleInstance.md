---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Disable-AzsInfrastructureRoleInstance

## SYNOPSIS
Shut down an infrastructure role instance.  On failure an exception is thrown.

## SYNTAX

### InfraRoleInstances_Shutdown (Default)
```
Disable-AzsInfrastructureRoleInstance -InfraRoleInstance <String> -ResourceGroupName <String>
 -Location <String> [-AsJob] [<CommonParameters>]
```

### InputObject_InfraRoleInstances_Update
```
Disable-AzsInfrastructureRoleInstance -InputObject <InfraRoleInstance> [-AsJob] [<CommonParameters>]
```

### ResourceId_InfraRoleInstances_Update
```
Disable-AzsInfrastructureRoleInstance -ResourceId <String> [-AsJob] [<CommonParameters>]
```

## DESCRIPTION
Shut down an infrastructure role instance.  On failure an exception is thrown.

## EXAMPLES

### Example 1
```
PS C:\> Disable-AzsInfrastructureRoleInstance -ResourceGroup "System.local" -Location "local" -InfrastructureRoleInstance "AzS-ACS01"
```

Shut down an infrastructure role instance.  On failure an exception is thrown.

## PARAMETERS

### -AsJob
Runs as a job.

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
Parameter Sets: InfraRoleInstances_Shutdown
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
Parameter Sets: InputObject_InfraRoleInstances_Update
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
Parameter Sets: InfraRoleInstances_Shutdown
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
Parameter Sets: InfraRoleInstances_Shutdown
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
Parameter Sets: ResourceId_InfraRoleInstances_Update
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

