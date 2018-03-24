function New-MVPPowerShellBugReportContribution {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [datetime]
        $StartDate = [datetime]::Now,

        [string]
        $Repository = 'PowerShell',

        [Parameter(Mandatory)]
        [long]
        $IssueNumber
    )
    process {
        $Issue = Invoke-RestMethod -Uri "https://api.github.com/repos/PowerShell/$Repository/issues/$IssueNumber" -ErrorAction stop
        if(-not $Issue) {
            Write-Error "PowerShell/$Repository#$IssueNumber not found."
            return
        }
        $Params = @{
            StartDate              = $StartDate.ToString('yyy-MM-dd')
            Title                  = 'Bug Report - {0} #{1}' -f $Issue.title, $IssueNumber
            Description            = 'Report a bug on a PowerShell Open Source project.' 
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
