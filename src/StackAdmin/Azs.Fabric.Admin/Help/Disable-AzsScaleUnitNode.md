---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Disable-AzsScaleUnitNode

## SYNOPSIS
Start maintenance mode for a scale unit node.  This begins the process of moving all resources off the node.

## SYNTAX

### ScaleUnitNodes_Disable (Default)
```
Disable-AzsScaleUnitNode -ScaleUnitNode <String> -ResourceGroupName <String> -Location <String> [-AsJob]
 [<CommonParameters>]
```

### InputObject_ScaleUnitNodes
```
Disable-AzsScaleUnitNode -InputObject <ScaleUnitNode> [-AsJob] [<CommonParameters>]
```

### ResourceId_ScaleUnitNodes
```
Disable-AzsScaleUnitNode -ResourceId <String> [-AsJob] [<CommonParameters>]
```

## DESCRIPTION
Start maintenance mode for a scale unit node.  This begins the process of moving all resources off the node.

## EXAMPLES

### Example 1
```
PS C:\> Disable-AzsScaleUnitNode -ResourceGroup "System.local" -Location "local" -ScaleUnitNode "HC1n25r2236"
```

Begin maintenance mode for a scale unit node.

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

### -InputObject
Scale unit node object.```yaml
Type: ScaleUnitNode
Parameter Sets: InputObject_ScaleUnitNodes
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
Parameter Sets: ScaleUnitNodes_Disable
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
Parameter Sets: ScaleUnitNodes_Disable
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceId
Scale unit node resource ID.```yaml
Type: String
Parameter Sets: ResourceId_ScaleUnitNodes
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ScaleUnitNode
Name of the scale unit node.

```yaml
Type: String
Parameter Sets: ScaleUnitNodes_Disable
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### Microsoft.AzureStack.Management.Fabric.Admin.Models.OperationStatus

## NOTES

## RELATED LINKS

