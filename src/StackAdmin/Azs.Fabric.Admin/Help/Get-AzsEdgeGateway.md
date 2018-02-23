---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Get-AzsEdgeGateway

## SYNOPSIS
Get edge gateways.

## SYNTAX

### EdgeGateways_List (Default)
```
Get-AzsEdgeGateway [-Filter <String>] [-Skip <Int32>] -ResourceGroupName <String> -Location <String>
 [-Top <Int32>] [<CommonParameters>]
```

### EdgeGateways_Get
```
Get-AzsEdgeGateway -Name <String> -ResourceGroupName <String> -Location <String> [<CommonParameters>]
```

### ResourceId_EdgeGateways_Get
```
Get-AzsEdgeGateway -ResourceId <String> [<CommonParameters>]
```

### InputObject_EdgeGateways_Get
```
Get-AzsEdgeGateway -InputObject <EdgeGateway> [<CommonParameters>]
```

## DESCRIPTION
Get edge gateways.

## EXAMPLES

### Example 1
```
PS C:\> Get-AzsEdgeGateway -ResourceGroup "System.local" -Location "local"

Type                                                State  TotalCapacity Name      AvailableCapacity
----                                                -----  ------------- ----      -----------------
Microsoft.Fabric.Admin/fabricLocations/edgeGateways Active 100000000     AzS-Gwy01 100000000
Microsoft.Fabric.Admin/fabricLocations/edgeGateways Active 200000000     AzS-Gwy02 100000000
```

Get a list of all edge gateways.

### Example 2
```
PS C:\> Get-AzsEdgeGateway -ResourceGroup "System.local" -Location "local" -EdgeGateway "AzS-Gwy01"

Type                                                State  TotalCapacity Name      AvailableCapacity
----                                                -----  ------------- ----      -----------------
Microsoft.Fabric.Admin/fabricLocations/edgeGateways Active 100000000     AzS-Gwy01 100000000
```

Get a specific edge gateway.

## PARAMETERS

### -Filter
OData filter parameter.

```yaml
Type: String
Parameter Sets: EdgeGateways_List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The input object of type Microsoft.AzureStack.Management.Fabric.Admin.Models.EdgeGateway.```yaml
Type: EdgeGateway
Parameter Sets: InputObject_EdgeGateways_Get
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
Parameter Sets: EdgeGateways_List, EdgeGateways_Get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the edge gateway.```yaml
Type: String
Parameter Sets: EdgeGateways_Get
Aliases: EdgeGateway

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
Name of the resource group.```yaml
Type: String
Parameter Sets: EdgeGateways_List, EdgeGateways_Get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceId
The resource id.```yaml
Type: String
Parameter Sets: ResourceId_EdgeGateways_Get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -Skip
Skip the first N items as specified by the parameter value.

```yaml
Type: Int32
Parameter Sets: EdgeGateways_List
Aliases:

Required: False
Position: Named
Default value: -1
Accept pipeline input: False
Accept wildcard characters: False
```

### -Top
Return the top N items as specified by the parameter value.
Applies after the -Skip parameter.

```yaml
Type: Int32
Parameter Sets: EdgeGateways_List
Aliases:

Required: False
Position: Named
Default value: -1
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### Microsoft.AzureStack.Management.Fabric.Admin.Models.EdgeGateway

## NOTES

## RELATED LINKS

