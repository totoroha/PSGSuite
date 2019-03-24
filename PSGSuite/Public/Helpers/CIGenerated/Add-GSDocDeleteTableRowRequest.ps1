function Add-GSDocDeleteTableRowRequest {
    <#
    .SYNOPSIS
    Creates a DeleteTableRowRequest to pass to Submit-GSDocBatchUpdate.

    .DESCRIPTION
    Creates a DeleteTableRowRequest to pass to Submit-GSDocBatchUpdate.

    .PARAMETER TableCellLocation
    Accepts the following type: Google.Apis.Docs.v1.Data.TableCellLocation.

    To create this type, use the function Add-GSDocTableCellLocation or instantiate the type directly via New-Object 'Google.Apis.Docs.v1.Data.TableCellLocation'.

    .PARAMETER Requests
    Enables pipeline input of other requests of the same type.

    .EXAMPLE
    Add-GSDocDeleteTableRowRequest -TableCellLocation $tableCellLocation
    #>
    [OutputType('Google.Apis.Docs.v1.Data.Request')]
    [CmdletBinding()]
    Param(
        [parameter()]
        [Google.Apis.Docs.v1.Data.TableCellLocation]
        $TableCellLocation,
        [parameter(ValueFromPipeline = $true)]
        [Google.Apis.Docs.v1.Data.Request[]]
        $Requests
    )
    Begin {
        Write-Verbose "Adding DeleteTableRowRequest to the pipeline"
    }
    Process {
        $Requests
    }
    End {
        $newRequest = New-Object 'Google.Apis.Docs.v1.Data.DeleteTableRowRequest'
        foreach ($prop in $PSBoundParameters.Keys | Where-Object {$newRequest.PSObject.Properties.Name -contains $_}) {
            $newRequest.$prop = $PSBoundParameters[$prop]
        }
        try {
            New-Object 'Google.Apis.Docs.v1.Data.Request' -Property @{
                DeleteTableRow = $newRequest
            }
        }
        catch {
            if ($ErrorActionPreference -eq 'Stop') {
                $PSCmdlet.ThrowTerminatingError($_)
            }
            else {
                Write-Error $_
            }
        }
    }
}