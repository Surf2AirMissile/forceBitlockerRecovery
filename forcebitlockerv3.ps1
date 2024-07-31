# Script to force BitLocker recovery, create a flag file, and restart the system

$flagFilePath = "C:\bitlocker-force.flag"

# Check if the flag file already exists
if (Test-Path $flagFilePath) {
    Write-Output "Flag file already exists. BitLocker force recovery command was previously executed."
    exit 0
}

# Run the manage-bde command
manage-bde -forcerecovery C:

# Check if the command was successful
if ($LASTEXITCODE -eq 0) {
    # Create the flag file
    New-Item -Path $flagFilePath -ItemType File -Force

    Write-Output "BitLocker force recovery command executed successfully. Flag file created."
    
    # Wait for a moment to ensure file creation is complete
    Start-Sleep -Seconds 5

    # Check if the flag file was created successfully
    if (Test-Path $flagFilePath) {
        Write-Output "Restarting the system in 10 seconds..."
        Start-Sleep -Seconds 10
        Restart-Computer -Force
    } else {
        Write-Output "Flag file creation failed. System will not restart."
    }
} else {
    Write-Output "BitLocker force recovery command failed. No flag file created. System will not restart."
}