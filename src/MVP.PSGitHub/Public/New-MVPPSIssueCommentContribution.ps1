function New-MVPPSIssueCommentContribution {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [long]
        $IssueNumber,

        [String]
        $Owner = 'PowerShell',

        [String]
        $Project = 'PowerShell',

        [datetime]
        $StartDate = [datetime]::Now,

        [Parameter(DontShow)]
        $BaseApiUri = (Get-BaseApiUri)
    )
    process {
        $GitHubResult = Invoke-RestMethod -Uri "$BaseApiUri/repos/$Owner/$Project/issues/$IssueNumber" -ErrorAction stop
        if(-not $GitHubResult) {
            Write-Error "$Owner/$Project#$IssueNumber not found."
            return
        }
        $Params = @{
            StartDate              = $StartDate.ToString('yyy-MM-dd')
            Title                  = 'PowerShell Issue Comment - {0} #{1}' -f $GitHubResult.title, $IssueNumber
            Description            = 'Provide feedback on PowerShell Issue.'
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
