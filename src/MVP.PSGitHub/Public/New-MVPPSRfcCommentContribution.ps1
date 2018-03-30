function New-MVPPSRfcCommentContribution {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [datetime]
        $StartDate = [datetime]::Now,

        [long]
        $RfcPRNumber
    )
    process {
        $PR = Invoke-RestMethod -Uri "https://api.github.com/repos/PowerShell/PowerShell-RFC/pulls/$RfcPRNumber" -ErrorAction stop
        if(-not $PR) {
            Write-Error "PowerShell/PowerShell-RFC#$RfcPRNumber not found."
            return
        }
        $Params = @{
            StartDate              = $StartDate.ToString('yyy-MM-dd')
            Title                  = 'PowerShell RFC Comment - {0} #{1}' -f $PR.title, $RfcPRNumber
            Description            = 'Provide feedback on PowerShell RFC' 
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
