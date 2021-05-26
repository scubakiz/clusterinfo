Add-Type -AssemblyName System.Web

function SendMessageToCI {
    param (
        $MessageBody, 
        $MessageHeader = "Next Command", 
        $MessageType = "Command")     # MessageTypes: Command, Code, Info

    $CIEntryPoint = "http://localhost:5252/api/ExternalMessage"

    # For local development (project default port)
    if (Test-Path 'env:CIDeveloperMode') {
        $CIEntryPoint = "http://localhost:6200/api/ExternalMessage"
    }

    # Write-Host $CIEntryPoint
    $Payload = @{
        Body        = $MessageBody;
        Header      = $MessageHeader;
        MessageType = $MessageType;
    }       
    $response = Invoke-WebRequest -Uri $CIEntryPoint -Body ($Payload | ConvertTo-Json) -method POST -ContentType "application/json"
}