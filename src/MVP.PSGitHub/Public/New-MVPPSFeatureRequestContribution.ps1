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
        $StartDate = [datetime]::Now,

        [Parameter(DontShow)]
        $BaseApiUri = (Get-ApiBaseUri)
    )
    process {
        $GitHubResult = Invoke-RestMethod -Uri "$GitHubResult/repos/$Owner/$Repository/issues/$IssueNumber" -ErrorAction stop
        if (-not $GitHubResult) {
            Write-Error "$Owner/$Repository#$IssueNumber not found."
            return
        }
        $Params = @{
            StartDate              = $StartDate.ToString('yyy-MM-dd')
            Title                  = 'Feature Request - {0} #{1}' -f $GitHubResult.title, $IssueNumber
            Description            = 'Request a feature on a PowerShell Open Source project.'
            ReferenceUrl           = $GitHubResult.html_url
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
