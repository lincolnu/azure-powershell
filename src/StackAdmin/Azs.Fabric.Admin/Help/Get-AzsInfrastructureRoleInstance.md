---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Get-AzsInfrastructureRoleInstance

## SYNOPSIS
Get a list of infrastructure role instances.

## SYNTAX

### InfraRoleInstances_List (Default)
```
Get-AzsInfrastructureRoleInstance [-Filter <String>] [-Skip <Int32>] -ResourceGroupName <String>
 -Location <String> [-Top <Int32>] [<CommonParameters>]
```

### InfraRoleInstances_Get
```
Get-AzsInfrastructureRoleInstance -ResourceGroupName <String> -Name <String> -Location <String>
 [<CommonParameters>]
```

### ResourceId_InfraRoleInstances_Get
```
Get-AzsInfrastructureRoleInstance -ResourceId <String> [<CommonParameters>]
```

### InputObject_InfraRoleInstances_Get
```
Get-AzsInfrastructureRoleInstance -InputObject <InfraRoleInstance> [<CommonParameters>]
```

## DESCRIPTION
Get a list of infrastructure role instances.

## EXAMPLES

### Example 1
```
PS C:\> Get-AzsInfrastructureRoleInstance -ResourceGroup "System.local" -Location "local"

Type                                                      State   Name         ScaleUnit
----                                                      -----   ----         ---------
Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-ACS01    /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-ADFS01   /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-BGPNAT01 /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-CA01     /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-Gwy01    /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-NC01     /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-SLB01    /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-Sql01    /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-WAS01    /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-WASP01   /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-Xrp01    /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
```

Return a list of all infrastructure roles instances.

### Example 2
```
PS C:\> Get-AzsInfrastructureRoleInstance -ResourceGroup "System.local" -Location "local" -Name "AzS-ACS01"

Microsoft.Fabric.Admin/fabricLocations/InfrastructureRoleInstances Running AzS-ACS01    /subscriptions/1c0daa04-01ae-4df9-a5d8-491b755f5288/resourceGroups/system.local/providers/Microsoft.Fabric....
```

Return a single infrastructure role instance based on name.

## PARAMETERS

### -Filter
OData filter parameter.

```yaml
Type: String
Parameter Sets: InfraRoleInstances_List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The input object of type Microsoft.AzureStack.Management.Fabric.Admin.Models.InfraRoleInstance.```yaml
Type: InfraRoleInstance
Parameter Sets: InputObject_InfraRoleInstances_Get
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
Parameter Sets: InfraRoleInstances_List, InfraRoleInstances_Get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Name of an infrastructure role instance.```yaml
Type: String
Parameter Sets: InfraRoleInstances_Get
Aliases: InfraRoleInstance

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
Name of the resource group.```yaml
Type: String
Parameter Sets: InfraRoleInstances_List, InfraRoleInstances_Get
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
Parameter Sets: ResourceId_InfraRoleInstances_Get
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
Parameter Sets: InfraRoleInstances_List
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
Parameter Sets: InfraRoleInstances_List
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

### Microsoft.AzureStack.Management.Fabric.Admin.Models.InfraRoleInstance

## NOTES

## RELATED LINKS

