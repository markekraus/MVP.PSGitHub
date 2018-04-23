---
external help file: MVP.PSGitHub-help.xml
Module Name: MVP.PSGitHub
online version: https://github.com/markekraus/MVP.PSGitHub/blob/master/Docs/New-MVPPSGistContribution.md
schema: 2.0.0
---

# New-MVPPSGistContribution

## SYNOPSIS
Creates a new PowerShell Gist MVP Contribution.

## SYNTAX

```
New-MVPPSGistContribution [-GistID] <String> [[-StartDate] <DateTime>] [[-ApiBaseUri] <Object>] [-WhatIf]
 [-Confirm] [<CommonParameters>]
```

## DESCRIPTION
Queries the GitHub API for the supplied Gist,
generates an MVP contribution,
then submits contribution to the MVP API.

Use this to easily submit MVP Contributions for creating PowerShell related Gists.

## EXAMPLES

### Example 1
```powershell
New-MVPPSGistContribution -GistID a550800e29547c9a6cbbe34bacca3274
```

This example will submit a MVP Contribution for the Gist a550800e29547c9a6cbbe34bacca3274.

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
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -GistID
The ID of the Gist.
This can be seen at the end of the gist URI.
For example, the gist
https://gist.github.com/markekraus/a550800e29547c9a6cbbe34bacca3274
has the ID of a550800e29547c9a6cbbe34bacca3274.

```yaml
Type: String
Parameter Sets: (All)
Aliases:

Required: True
Position: 0
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
Position: 1
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

[https://github.com/markekraus/MVP.PSGitHub/blob/master/Docs/New-MVPPSGistContribution.md](https://github.com/markekraus/MVP.PSGitHub/blob/master/Docs/New-MVPPSGistContribution.md)
