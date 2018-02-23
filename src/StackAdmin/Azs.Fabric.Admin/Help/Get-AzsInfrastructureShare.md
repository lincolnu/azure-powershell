---
external help file: Azs.Fabric.Admin-help.xml
Module Name: Azs.Fabric.Admin
online version:
schema: 2.0.0
---

# Get-AzsInfrastructureShare

## SYNOPSIS
Get file shares.

## SYNTAX

### FileShares_List (Default)
```
Get-AzsInfrastructureShare [-Filter <String>] -ResourceGroupName <String> -Location <String>
 [<CommonParameters>]
```

### FileShares_Get
```
Get-AzsInfrastructureShare -ResourceGroupName <String> -Name <String> -Location <String> [<CommonParameters>]
```

### ResourceId_FileShares_Get
```
Get-AzsInfrastructureShare -ResourceId <String> [<CommonParameters>]
```

### InputObject_FileShares_Get
```
Get-AzsInfrastructureShare -InputObject <FileShare> [<CommonParameters>]
```

## DESCRIPTION
Get file shares.

## EXAMPLES

### Example 1
```
PS C:\> Get-AzsInfrastructureShare -ResourceGroup "System.local" -Location local

Type                                              UncPath                                               Name                 Location AssociatedVolume
----                                              -------                                               ----                 -------- ----------------
Microsoft.Fabric.Admin/fabricLocations/fileShares \\SU1FileServer.azurestack.local\SU1_Infrastructure_1 SU1_Infrastructure_1 local    a42d219b
Microsoft.Fabric.Admin/fabricLocations/fileShares \\SU1FileServer.azurestack.local\SU1_Infrastructure_2 SU1_Infrastructure_2 local    a42d219b
Microsoft.Fabric.Admin/fabricLocations/fileShares \\SU1FileServer.azurestack.local\SU1_Infrastructure_3 SU1_Infrastructure_3 local    a42d219b
Microsoft.Fabric.Admin/fabricLocations/fileShares \\SU1FileServer.azurestack.local\SU1_ObjStore         SU1_ObjStore         local    a42d219b
Microsoft.Fabric.Admin/fabricLocations/fileShares \\SU1FileServer.azurestack.local\SU1_Public           SU1_Public           local    a42d219b
Microsoft.Fabric.Admin/fabricLocations/fileShares \\SU1FileServer.azurestack.local\SU1_VmTemp           SU1_VmTemp           local    a42d219b
```

Returns a list of all file shares.

### Example 2
```
PS C:\> Get-AzsInfrastructureShare -ResourceGroup "System.local" -Location local -Share Microsoft.AzureStack.Management.Fabric.Admin.Models.FileShare.Name

Type                                              UncPath                                               Name                 Location AssociatedVolume
----                                              -------                                               ----                 -------- ----------------
Microsoft.Fabric.Admin/fabricLocations/fileShares \\SU1FileServer.azurestack.local\SU1_Infrastructure_1 SU1_Infrastructure_1 local    a42d219b
```

Returns a file shares based on name.

## PARAMETERS

### -Filter
OData filter parameter.

```yaml
Type: String
Parameter Sets: FileShares_List
Aliases:

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -InputObject
The input object of type Microsoft.AzureStack.Management.Fabric.Admin.Models.FileShare.```yaml
Type: FileShare
Parameter Sets: InputObject_FileShares_Get
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
Parameter Sets: FileShares_List, FileShares_Get
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Name
Fabric file share name.```yaml
Type: String
Parameter Sets: FileShares_Get
Aliases: FileShare

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ResourceGroupName
Name of the resource group.```yaml
Type: String
Parameter Sets: FileShares_List, FileShares_Get
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
Parameter Sets: ResourceId_FileShares_Get
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

### Microsoft.AzureStack.Management.Fabric.Admin.Models.FileShare

## NOTES

## RELATED LINKS

