---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Add-AzsScaleUnitNode

## SYNOPSIS

## SYNTAX

### ScaleUnits_ScaleOut (Default)
```
Add-AzsScaleUnitNode [-AwaitStorageConvergence] [-NodeList <ScaleOutScaleUnitParameters[]>]
 -ResourceGroupName <String> -ScaleUnit <String> -Location <String> [-AsJob] [<CommonParameters>]
```

### InputObject_ScaleUnits
```
Add-AzsScaleUnitNode -InputObject <ScaleUnit> [-AsJob] [<CommonParameters>]
```

### ResourceId_ScaleUnits
```
Add-AzsScaleUnitNode -ResourceId <String> [-AsJob] [<CommonParameters>]
```

## DESCRIPTION
Add a new scale unit.

## EXAMPLES

### Example 1
```
PS C:\> Add-AzsScaleUnitNode -ResourceGroup "System.local" -Location "local" - ScaleUnit "Azs-ERC03" -NodeList $nodeList
```

Add a new scale unit node.

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

### -AwaitStorageConvergence
Flag indicates if the operation should wait for storage to converge before returning.

```yaml
Type: SwitchParameter
Parameter Sets: ScaleUnits_ScaleOut
Aliases:

Required: False
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Scale unit node object.

```yaml
Type: ScaleUnit
Parameter Sets: InputObject_ScaleUnits
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
Parameter Sets: ScaleUnits_ScaleOut
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NodeList
List of nodes in the scale unit.

```yaml
Type: ScaleOutScaleUnitParameters[]
Parameter Sets: ScaleUnits_ScaleOut
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
Name of the resource group.

```yaml
Type: String
Parameter Sets: ScaleUnits_ScaleOut
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceId
Scale unit node resource ID.

```yaml
Type: String
Parameter Sets: ResourceId_ScaleUnits
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -ScaleUnit
Name of the scale units.

```yaml
Type: String
Parameter Sets: ScaleUnits_ScaleOut
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

## NOTES

## RELATED LINKS

