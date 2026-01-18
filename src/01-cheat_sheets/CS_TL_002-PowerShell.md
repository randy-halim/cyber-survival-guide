PowerShell. If you are working extensively in
# PowerShell Remoting
Always helpful use a tool such as **PowerShell ISE** (on Windows) which can hold context while you script.

When remoting, you can save credentials to a variable to reduce downtime caused by retyping passwords:
```powershell
$Creds = Get-Credential "<DOMAIN>\<USERNAME>" # prompts for password
```

There are two ways to remote: using a **PSSession** or running one-off commands/scripts. **PSSession** is recommended especially if you want to copy files to/from the remote machine.
## With PSSession
```powershell
$Session = New-PSSession -ComputerName <IP_OR_FQDN> -Credential $Creds
Enter-PSSession $Session
```

You'll need to make sure you remove PSSessions once you are done interacting with them (they don't automatically close).
```powershell
Remove-PSSession $Session # replace $Session with * to remove all sessions.
```
### Copying Files To/From
Requires you have a PSSession already set up and active. Absolute paths are *recommended* in both the local and remote path to minimize ambiguity.
```powershell
# case 1: copy from your machine to remote machine
Copy-Item -Path <LOCAL_PATH> -ToSession $Session -Destination <REMOTE_PATH>

# case 2: copy from remote machine to your machine
Copy-Item -FromSession $Session -Path <REMOTE_PATH> -Destination <LOCAL_PATH>
```
## With `Invoke-Command`
`Invoke-Command` is a cmdlet that runs a one-off command (or script, if you choose) on a remote machine. Has the added benefit of not having to keep track of your PSSessions.

If running as a `-ScriptBlock`, it functions like a standard block of code (like when using `for` loops), meaning you can expand it to be multiline.
```powershell
# case 1: run a command (or set of commands)
Invoke-Command -Credential $Creds -ComputerName <IP_OR_FQDN> -ScriptBlock { <COMMANDS_TO_RUN> }

# case 2: run a script you have on your machine
Invoke-Command -Credential $Creds -ComputerName <IP_OR_FQDN> -FilePath <PATH_TO_SCRIPT>.ps1 [-ArgumentList <ARGS_ARRAY>]
```

In either case, you have the option to save the output from that remote machine to a file by piping it **outside** the `-ScriptBlock` or passed script (read: *after* the right curly brace). See this block of code for an example:
```powershell
# example: run Get-Process on a remote machine, pipe it to CSV on the local machine.
Invoke-Command -Credential $Creds -ComputerName dc1.example.net -ScriptBlock { Get-Process } | Export-Csv C:\Hunt\dc1-processes.csv
```
### Targeting Multiple Hosts
If you have multiple computers, you can run one `Invoke-Command` against multiple computers by passing in an array to `-ComputerName`. How you get the array is up to you: straight up hand-jam in ISE, read in from a `.txt` file, or read in from a `.csv` file with `Select-Object` are common ways.
```powershell
# example: hand-jam several computer names
$TargetComputers = $("dc1.example.net", "ws1.example.net", "ws2.example.net")
Invoke-Command -Credential $Creds -ComputerName $TargetComputers -ScriptBlock { Get-Process } | Export-Csv C:\Hunt\process-baseline.csv
```

When saving outputs from a multiple-host invoking of `Invoke-Command`, there is another column added to specify which computer the individual record came from.