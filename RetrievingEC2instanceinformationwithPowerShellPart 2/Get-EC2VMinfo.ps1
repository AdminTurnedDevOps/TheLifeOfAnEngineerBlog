function Get-EC2VMinfo {
    [cmdletbinding(ConfirmImpact = 'low', SupportsShouldProcess = $true, DefaultParameterSetName = 'ec2info')]
    param(
        [parameter(Position = 0,
            ParameterSetName = 'ec2info',
            HelpMessage = 'If you would like to search for a specific instance, please enter the instance ID now')]
        [string]$instanceID,

        [parameter(Position = 1,
            Mandatory = $true,
            ParameterSetName = 'ec2info',
            HelpMessage = 'Please enter your region')]
        [ValidateNotNullOrEmpty()]
        [string]$Region
        
    )

    begin { Write-Output 'Collecting information on running instances' }
    process {
        try:
        if ($PSBoundParameters.ContainsKey($instanceID)) {
            $newInstanceSPLAT = @{
                'Region'     = $Region
                'InstanceId' = $instanceID
            }

            $NewInstance = Get-EC2Instance @newInstanceSPLAT

            $NewInstanceOBJECT = [pscustomobject] @{
                'InstanceName' = $NewInstance.RunningInstance.Tag
                'InstanceID'   = $NewInstance.RunningInstance.InstanceID
                'AMI'          = $NewInstance.RunningInstance.ImageId
                'InstanceType' = $NewInstance.RunningInstance.InstanceType
                'PrivateIP'    = $NewInstance.RunningInstance.PrivateIpAddress
                'PublicIP'     = $NewInstance.RunningInstance.PublicIpAddress
            }
            $NewInstanceOBJECT

        }#if

        else {
            $newInstancenoIDSPLAT = @{
                'Region' = $Region
            }

            $NewInstancenoID = Get-EC2Instance @newInstancenoIDSPLAT

            $NewInstanceOBJECT = [pscustomobject] @{
                'InstanceName' = $NewInstancenoID.RunningInstance.Tag
                'InstanceID'   = $NewInstancenoID.RunningInstance.InstanceID
                'AMI'          = $NewInstancenoID.RunningInstance.ImageId
                'InstanceType' = $NewInstancenoID.RunningInstance.InstanceType
                'PrivateIP'    = $NewInstancenoID.RunningInstance.PrivateIpAddress
                'PublicIP'     = $NewInstancenoID.RunningInstance.PublicIpAddress
            }
            $NewInstanceOBJECT
        }#else
        catch {
            Write-Warning 'An error has occured!'
            $PSCmdlet.ThrowTerminatingError($_)
        }#Catch
        
    }#Process
    end { }



}#Function