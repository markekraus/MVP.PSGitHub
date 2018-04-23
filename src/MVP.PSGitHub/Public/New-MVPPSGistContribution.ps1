function New-MVPPSGistContribution {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory)]
        [String]
        $GistID,

        [datetime]
        $StartDate = [datetime]::Now,

        [Parameter(DontShow)]
        $ApiBaseUri = (Get-ApiBaseUri)
    )
    process {
        $GitHubResult = Invoke-RestMethod -Uri "$ApiBaseUri/gists/$GistID" -ErrorAction stop
        if (-not $GitHubResult) {
            Write-Error "$GistID not found."
            return
        }
        $Params = @{
            StartDate              = $StartDate.ToString('yyy-MM-dd')
            Title                  = 'PowerShell Gist - {0} ({1})' -f $GitHubResult.description, $GistID
            Description            = 'Create a PowerShell Related Gist.'
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
