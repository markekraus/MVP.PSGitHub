function New-MVPPSFeatureRequestContribution {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [long]
        $IssueNumber,

        [String]
        $Owner = 'PowerShell',

        [string]
        $Repository = 'PowerShell',

        [datetime]
        $StartDate = [datetime]::Now
    )
    process {
        $Issue = Invoke-RestMethod -Uri "https://api.github.com/repos/$Owner/$Repository/issues/$IssueNumber" -ErrorAction stop
        if(-not $Issue) {
            Write-Error "$Owner/$Repository#$IssueNumber not found."
            return
        }
        $Params = @{
            StartDate              = $StartDate.ToString('yyy-MM-dd')
            Title                  = 'Feature Request - {0} #{1}' -f $Issue.title, $IssueNumber
            Description            = 'Request a feature on a PowerShell Open Source project.' 
            ReferenceUrl           = $Issue.html_url 
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
