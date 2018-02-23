---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Get-AzsEdgeGatewayPool

## SYNOPSIS
Get edge gateway pools.

## SYNTAX

### EdgeGatewayPools_List (Default)
```
Get-AzsEdgeGatewayPool [-Filter <String>] [-Skip <Int32>] -ResourceGroupName <String> -Location <String>
 [-Top <Int32>] [<CommonParameters>]
```

### EdgeGatewayPools_Get
```
Get-AzsEdgeGatewayPool -Name <String> -ResourceGroupName <String> -Location <String> [<CommonParameters>]
```

### ResourceId_EdgeGatewayPools_Get
```
Get-AzsEdgeGatewayPool -ResourceId <String> [<CommonParameters>]
```

### InputObject_EdgeGatewayPools_Get
```
Get-AzsEdgeGatewayPool -InputObject <EdgeGatewayPool> [<CommonParameters>]
```

## DESCRIPTION
Get edge gateway pools.

## EXAMPLES

### Example 1
```
PS C:\> Get-AzsEdgeGatewayPool -ResourceGroup "System.local" -Location "local"

GatewayCapacityKiloBitsPerSecond Type                                                    GreVipSubnet PublicIpAddress                      EdgeGateways
-------------------------------- ----                                                    ------------ ---------------                      ------------
100000000                        Microsoft.Fabric.Admin/fabricLocations/edgeGatewayPools              00000000-5555-0000-0001-000000000000 {AzS-Gwy01}
200000000                        Microsoft.Fabric.Admin/fabricLocations/edgeGatewayPools              00000000-4444-0000-0001-000000000000 {AzS-Gwy02}
```

Get a list of all Edge Gateway pools.

### Example 2
```
PS C:\> Get-AzsEdgeGatewayPool -ResourceGroup "System.local" -Location "local" -EdgeGatewayPool "AzS-Gwy01"

GatewayCapacityKiloBitsPerSecond Type                                                    GreVipSubnet PublicIpAddress                      EdgeGateways
-------------------------------- ----                                                    ------------ ---------------                      ------------
100000000                        Microsoft.Fabric.Admin/fabricLocations/edgeGatewayPools              00000000-5555-0000-0001-000000000000 {AzS-Gwy01}
```

Get a specific edge gateway pool.

## PARAMETERS

### -Filter
OData filter parameter.

```yaml
Type: String
Parameter Sets: EdgeGatewayPools_List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The input object of type Microsoft.AzureStack.Management.Fabric.Admin.Models.EdgeGatewayPool.```yaml
Type: EdgeGatewayPool
Parameter Sets: InputObject_EdgeGatewayPools_Get
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
Parameter Sets: EdgeGatewayPools_List, EdgeGatewayPools_Get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the edge gateway pool.```yaml
Type: String
Parameter Sets: EdgeGatewayPools_Get
Aliases: EdgeGatewayPool

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
Name of the resource group.```yaml
Type: String
Parameter Sets: EdgeGatewayPools_List, EdgeGatewayPools_Get
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
Parameter Sets: ResourceId_EdgeGatewayPools_Get
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
Parameter Sets: EdgeGatewayPools_List
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
Parameter Sets: EdgeGatewayPools_List
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

### Microsoft.AzureStack.Management.Fabric.Admin.Models.EdgeGatewayPool

## NOTES

## RELATED LINKS

