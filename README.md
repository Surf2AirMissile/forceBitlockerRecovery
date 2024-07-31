This script checks for a .flag file on the C:/ drive, proceeds to run the manage-bde -forcerecovery command on C:, if successful, creates a .flag file on C: and immediately reboots to force the device into the Bitlocker Recovery screen. The benefit of the flag file is to avoid multiple executions of the script, and to prevent accidental relocking.

This need for this arose during lost/stolen/overdue devices scenarios and Intune lacking a pre-existing way to "lock" Windows devices, and not rely solely on full data wipes. There needed to be a way to recover data if the device was recovered.
