---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Repair-AzsScaleUnitNode

## SYNOPSIS
Repairs a node of the cluster.

## SYNTAX

### ScaleUnitNodes_Repair (Default)
```
Repair-AzsScaleUnitNode [-BiosVersion <String>] [-BMCIPv4Address <String>] [-Model <String>]
 [-SerialNumber <String>] [-MacAddress <String>] [-Vendor <String>] -ResourceGroupName <String>
 -ScaleUnitNode <String> [-ComputerName <String>] -Location <String> [-ClusterName <String>] [-AsJob]
 [<CommonParameters>]
```

### ResourceId_ScaleUnitNodes
```
Repair-AzsScaleUnitNode [-BiosVersion <String>] [-BMCIPv4Address <String>] [-Model <String>]
 [-SerialNumber <String>] [-MacAddress <String>] [-Vendor <String>] [-ComputerName <String>]
 [-ClusterName <String>] -ResourceId <String> [-AsJob] [<CommonParameters>]
```

### InputObject_ScaleUnitNodes
```
Repair-AzsScaleUnitNode [-BiosVersion <String>] [-BMCIPv4Address <String>] [-Model <String>]
 [-SerialNumber <String>] [-MacAddress <String>] [-Vendor <String>] [-ComputerName <String>]
 [-ClusterName <String>] -InputObject <ScaleUnitNode> [-AsJob] [<CommonParameters>]
```

## DESCRIPTION
Repairs a node of the cluster.

## EXAMPLES

### Example 1
```
PS C:\> Repair-AzsScaleUnitNode -ResourceGroup "System.local" -Location "local" -ScaleUnitNode "AZS-ERCO03"
```

Repair a scale unit node.

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

### -BiosVersion
Bios version of the physical machine.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -BMCIPv4Address
BMC address of the physical machine.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ClusterName
Name of the cluster.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ComputerName
Name of the computer.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
Scale unit node object.

```yaml
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
Parameter Sets: ScaleUnitNodes_Repair
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -MacAddress
Name of the MAC address of the bare metal node.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Model
Model of the physical machine.

```yaml
Type: String
Parameter Sets: (All)
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
Parameter Sets: ScaleUnitNodes_Repair
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
Parameter Sets: ScaleUnitNodes_Repair
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -SerialNumber
Serial number of the physical machine.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Vendor
Vendor of the physical machine.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
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

