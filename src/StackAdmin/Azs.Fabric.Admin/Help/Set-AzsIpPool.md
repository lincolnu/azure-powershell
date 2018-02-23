---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Set-AzsIpPool

## SYNOPSIS
Update an IP pool.

## SYNTAX

### IpPools_Update (Default)
```
Set-AzsIpPool [-EndIpAddress <String>] [-NumberOfIpAddresses <Int64>] [-AddressPrefix <String>]
 [-StartIpAddress <String>] [-NumberOfIpAddressesInTransition <Int64>] -Name <String>
 [-Tags <System.Collections.Generic.Dictionary`2[System.String,System.String]>] -ResourceGroupName <String>
 -Location <String> [-NumberOfAllocatedIpAddresses <Int64>] [-AsJob] [<CommonParameters>]
```

### ResourceId_IpPools_Update
```
Set-AzsIpPool [-EndIpAddress <String>] [-NumberOfIpAddresses <Int64>] -ResourceId <String>
 [-AddressPrefix <String>] [-StartIpAddress <String>] [-NumberOfIpAddressesInTransition <Int64>]
 [-Tags <System.Collections.Generic.Dictionary`2[System.String,System.String]>]
 [-NumberOfAllocatedIpAddresses <Int64>] [-AsJob] [<CommonParameters>]
```

### InputObject_IpPools_Update
```
Set-AzsIpPool -InputObject <IpPool> [-AsJob] [<CommonParameters>]
```

## DESCRIPTION
Update an IP pool.

## EXAMPLES

### Example 1
```
PS C:\> Set-AzsIpPool -ResourceGroup "System.local" -Location "local" -IpPool "Pool4" -Tags $updatedTags
```

Update the tags of an IP pool.

## PARAMETERS

### -AddressPrefix
The address prefix.

```yaml
Type: String
Parameter Sets: IpPools_Update, ResourceId_IpPools_Update
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

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

### -EndIpAddress
The ending IP address.

```yaml
Type: String
Parameter Sets: IpPools_Update, ResourceId_IpPools_Update
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The input object of type Microsoft.AzureStack.Management.Fabric.Admin.Models.IpPool.

```yaml
Type: IpPool
Parameter Sets: InputObject_IpPools_Update
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByValue)
Accept wildcard characters: False
```

### -Location
The region where the resource is located.

```yaml
Type: String
Parameter Sets: IpPools_Update
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of the resource.

```yaml
Type: String
Parameter Sets: IpPools_Update
Aliases: IpPool

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -NumberOfAllocatedIpAddresses
The number of currently allocated IP addresses.

```yaml
Type: Int64
Parameter Sets: IpPools_Update, ResourceId_IpPools_Update
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -NumberOfIpAddresses
The total number of IP addresses.

```yaml
Type: Int64
Parameter Sets: IpPools_Update, ResourceId_IpPools_Update
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -NumberOfIpAddressesInTransition
The current number of IP addresses in transition.

```yaml
Type: Int64
Parameter Sets: IpPools_Update, ResourceId_IpPools_Update
Aliases:

Required: False
Position: Named
Default value: 0
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
Name of the resource group.

```yaml
Type: String
Parameter Sets: IpPools_Update
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceId
The resource id.

```yaml
Type: String
Parameter Sets: ResourceId_IpPools_Update
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: True (ByPropertyName)
Accept wildcard characters: False
```

### -StartIpAddress
The starting IP address.

```yaml
Type: String
Parameter Sets: IpPools_Update, ResourceId_IpPools_Update
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Tags
List of key-value pairs.

```yaml
Type: System.Collections.Generic.Dictionary`2[System.String,System.String]
Parameter Sets: IpPools_Update, ResourceId_IpPools_Update
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

### Microsoft.AzureStack.Management.Fabric.Admin.Models.ProvisioningState

## NOTES

## RELATED LINKS

