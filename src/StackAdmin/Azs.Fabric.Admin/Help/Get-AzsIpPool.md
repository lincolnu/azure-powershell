---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Get-AzsIpPool

## SYNOPSIS
Get infrastructure ip pools.

## SYNTAX

### IpPools_List (Default)
```
Get-AzsIpPool [-Filter <String>] -ResourceGroupName <String> -Location <String> [-Top <Int32>] [-Skip <Int32>]
 [<CommonParameters>]
```

### IpPools_Get
```
Get-AzsIpPool -Name <String> -ResourceGroupName <String> -Location <String> [<CommonParameters>]
```

### ResourceId_IpPools_Get
```
Get-AzsIpPool -ResourceId <String> [<CommonParameters>]
```

### InputObject_IpPools_Get
```
Get-AzsIpPool -InputObject <IpPool> [<CommonParameters>]
```

## DESCRIPTION
Get infrastructure ip pools.

## EXAMPLES

### Example 1
```
PS C:\> Get-AzsIpPool -ResourceGroup "System.local" -Location "redmond"

NumberOfIpAddressesInTransition StartIpAddress  Type                                           AddressPrefix NumberOfIpAddresses
------------------------------- --------------  ----                                           ------------- -------------------
0                               192.168.105.1   Microsoft.Fabric.Admin/fabricLocations/ipPools               255
0                               192.168.200.112 Microsoft.Fabric.Admin/fabricLocations/ipPools               16
0                               192.168.200.65  Microsoft.Fabric.Admin/fabricLocations/ipPools               47
0                               192.168.200.1   Microsoft.Fabric.Admin/fabricLocations/ipPools               62
0                               192.168.102.1   Microsoft.Fabric.Admin/fabricLocations/ipPools               255
0                               192.168.200.224 Microsoft.Fabric.Admin/fabricLocations/ipPools               31
```

Get a list of all infrastructure ip pools.

### Example 2
```
PS C:\> Get-AzsIpPool -ResourceGroup "System.local" -Location "redmond" -IpPool "08786a0f-ad8c-43aa-a154-06083abfc1ac"

NumberOfIpAddressesInTransition StartIpAddress Type                                           AddressPrefix NumberOfIpAddresses
------------------------------- -------------- ----                                           ------------- -------------------
0                               192.168.105.1  Microsoft.Fabric.Admin/fabricLocations/ipPools               255
```

Get an infrastructure ip pool based on name.

## PARAMETERS

### -Filter
OData filter parameter.

```yaml
Type: String
Parameter Sets: IpPools_List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The input object of type Microsoft.AzureStack.Management.Fabric.Admin.Models.IpPool.```yaml
Type: IpPool
Parameter Sets: InputObject_IpPools_Get
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
Parameter Sets: IpPools_List, IpPools_Get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
IP pool name.```yaml
Type: String
Parameter Sets: IpPools_Get
Aliases: IpPool

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
Name of the resource group.```yaml
Type: String
Parameter Sets: IpPools_List, IpPools_Get
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
Parameter Sets: ResourceId_IpPools_Get
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
Parameter Sets: IpPools_List
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
Parameter Sets: IpPools_List
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

### Microsoft.AzureStack.Management.Fabric.Admin.Models.IpPool

## NOTES

## RELATED LINKS

