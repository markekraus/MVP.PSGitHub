---
external help file: MVP.PSGitHub-help.xml
Module Name: MVP.PSGitHub
online version:
schema: 2.0.0
---

# New-MVPPSRfcContribution

## SYNOPSIS
Creates a new PowerShell RFC MVP Contribution.

## SYNTAX

```
New-MVPPSRfcContribution [-PRNumber] <Int64> [[-Owner] <String>] [[-Repository] <String>]
 [[-StartDate] <DateTime>] [[-ApiBaseUri] <Object>] [-WhatIf] [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Queries the GitHub API for the supplied issue,
generates an MVP contribution,
then submits contribution to the MVP API.

Use this to easily submit MVP Contributions for creating RFC's in PowerShell related GitHub repositories.

## EXAMPLES

### Example 1
```powershell
New-MVPPSRfcContribution -PRNumber 124
```

This example will submit a MVP Contribution for pull request 124 in the PowerShell/PowerShell-RFC GitHub repository.

## PARAMETERS

### -ApiBaseUri
Base URI of the GitHub API.
The default is https://api.github.com
This can be overridden using the configuration module.

```yaml
Type: Object
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Owner
The GitHub Owner of the project.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -PRNumber
The Pull Request of the PowerShell RFC on which the comment was made.

```yaml
Type: Int64
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Repository
The GitHub repository.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -StartDate
The date to use for the MVP Contribution.
The default is the current date.

```yaml
Type: DateTime
Parameter Sets: (All)
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Confirm
Prompts you for confirmation before running the cmdlet.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: cf

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -WhatIf
Shows what would happen if the cmdlet runs.
The cmdlet is not run.

```yaml
Type: SwitchParameter
Parameter Sets: (All)
Aliases: wi

Required: False
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see about_CommonParameters (http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object

## NOTES

## RELATED LINKS

[https://github.com/markekraus/MVP.PSGitHub/blob/master/Docs/New-MVPPSRfcContribution.md](https://github.com/markekraus/MVP.PSGitHub/blob/master/Docs/New-MVPPSRfcContribution.md)
