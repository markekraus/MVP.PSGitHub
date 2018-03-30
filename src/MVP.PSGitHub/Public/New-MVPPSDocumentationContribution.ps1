function New-MVPPSDocumentationContribution {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [long]
        $PRNumber,

        [String]
        $Owner = 'PowerShell',

        [String]
        $Project = 'PowerShell-Docs',

        [datetime]
        $StartDate = [datetime]::Now
    )
    process {
        $PR = Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Project/pulls/$PRNumber" -ErrorAction stop
        if(-not $PR) {
            Write-Error "$Owner/$Project#$PRNumber not found."
            return
        }
        $Params = @{
            StartDate              = $StartDate.ToString('yyy-MM-dd')
            Title                  = 'PowerShell Documentation - {0} #{1}' -f $PR.title, $PRNumber
            Description            = 'Provide documentation for PowerShell.' 
            ReferenceUrl           = $PR.html_url 
            AnnualQuantity         = 1 
            SecondAnnualQuantity   = 0 
            AnnualReach            = 0 
            Visibility             = 'Everyone'
            ContributionTechnology = 'PowerShell'
            ContributionType       = 'Open Source Project(s)'
        }
        if ($PSCmdlet.ShouldProcess($($Params | ConvertTo-Json -Compress))) {
            New-MVPContribution @Params
        }
    }
}
