---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Restart-AzsInfrastructureRole

## SYNOPSIS
Restarts the requestd infrastructure role.

## SYNTAX

### InfraRoles_Restart (Default)
```
Restart-AzsInfrastructureRole -ResourceGroupName <String> -InfraRole <String> -Location <String> [-AsJob]
 [<CommonParameters>]
```

### ResourceId_InfraRoles
```
Restart-AzsInfrastructureRole -ResourceId <String> [-AsJob] [<CommonParameters>]
```

### InputObject_InfraRoles
```
Restart-AzsInfrastructureRole -InputObject <InfraRole> [-AsJob] [<CommonParameters>]
```

## DESCRIPTION
Restarts the requestd infrastructure role.

## EXAMPLES

### Example 1
```
PS C:\> Restart-AzsInfrastructureRole -ResourceGroup "System.local" -Location "local" -InfraRole "Active Directory Federation Services"
```

Restart an infrastructure role which has crashed.

## PARAMETERS

### -AsJob
{{Fill AsJob Description}}

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

### -InfraRole
Infrastructure role name.

```yaml
Type: String
Parameter Sets: InfraRoles_Restart
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Infrastructure role object.

```yaml
Type: InfraRole
Parameter Sets: InputObject_InfraRoles
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
Parameter Sets: InfraRoles_Restart
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
Name of the resource group.

```yaml
Type: String
Parameter Sets: InfraRoles_Restart
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceId
Infrastructure role resource ID.

```yaml
Type: String
Parameter Sets: ResourceId_InfraRoles
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

## NOTES

## RELATED LINKS

