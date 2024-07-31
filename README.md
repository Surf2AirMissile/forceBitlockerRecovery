This script checks for a .flag file on the C:/ drive, proceeds to run the manage-bde -forcerecovery command on C:, if successful, immediately reboots to force the device into the Bitlocker Recovery screen.

This need for this arose for lost/stolen/overborrowed devices and Intune lacking a way to "lock" and not fully wipe remote devices. There needed to be a way to still recover data, if the device is recovered.
