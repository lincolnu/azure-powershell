---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Get-AzsSlbMuxInstance

## SYNOPSIS
Get software load balanacer multiplexer instances at a certain location.

## SYNTAX

### SlbMuxInstances_List (Default)
```
Get-AzsSlbMuxInstance [-Filter <String>] [-Skip <Int32>] -ResourceGroupName <String> -Location <String>
 [-Top <Int32>] [<CommonParameters>]
```

### SlbMuxInstances_Get
```
Get-AzsSlbMuxInstance -ResourceGroupName <String> -Name <String> -Location <String> [<CommonParameters>]
```

### ResourceId_SlbMuxInstances_Get
```
Get-AzsSlbMuxInstance -ResourceId <String> [<CommonParameters>]
```

### InputObject_SlbMuxInstances_Get
```
Get-AzsSlbMuxInstance -InputObject <SlbMuxInstance> [<CommonParameters>]
```

## DESCRIPTION
Get software load balanacer multiplexer instances at a certain location.

## EXAMPLES

### Example 1
```
PS C:\> Get-AzsSlbMuxInstance -ResourceGroup "System.local" -Location "local"

BgpPeers                 ConfigurationState Type                                                   VirtualServer Name
--------                 ------------------ ----                                                   ------------- ----
{BGPGateway-64000-64001} Success            Microsoft.Fabric.Admin/fabricLocations/slbMuxInstances AzS-SLB01     AzS-SLB01
{BGPGateway-64000-64001} Success            Microsoft.Fabric.Admin/fabricLocations/slbMuxInstances AzS-SLB02     AzS-SLB02
```

Get all software load balancer multiplexer instance at a location.

### Example 2
```
PS C:\> Get-AzsSlbMuxInstance -ResourceGroup "System.local" -Location "local" -SlbMuxInstance "AzS-SLB01"

BgpPeers                 ConfigurationState Type                                                   VirtualServer Name
--------                 ------------------ ----                                                   ------------- ----
{BGPGateway-64000-64001} Success            Microsoft.Fabric.Admin/fabricLocations/slbMuxInstances AzS-SLB01     AzS-SLB01
```

Get a specific software load balancer multiplexer instance at a location given a name.

## PARAMETERS

### -Filter
OData filter parameter.

```yaml
Type: String
Parameter Sets: SlbMuxInstances_List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The input object of type Microsoft.AzureStack.Management.Fabric.Admin.Models.SlbMuxInstance.```yaml
Type: SlbMuxInstance
Parameter Sets: InputObject_SlbMuxInstances_Get
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
Parameter Sets: SlbMuxInstances_List, SlbMuxInstances_Get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of a SLB MUX instance.```yaml
Type: String
Parameter Sets: SlbMuxInstances_Get
Aliases: SlbMuxInstance

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
Name of the resource group.```yaml
Type: String
Parameter Sets: SlbMuxInstances_List, SlbMuxInstances_Get
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
Parameter Sets: ResourceId_SlbMuxInstances_Get
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
Parameter Sets: SlbMuxInstances_List
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
Parameter Sets: SlbMuxInstances_List
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

### Microsoft.AzureStack.Management.Fabric.Admin.Models.SlbMuxInstance

## NOTES

## RELATED LINKS

