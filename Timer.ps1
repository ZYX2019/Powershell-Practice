$wshell = New-Object -ComObject Wscript.Shell

#Set timer in minute for user input

$Settime = Read-host -Prompt "Minute"

#Add new time for system to process (Not needed here, for any other system trigger)

$Newtime = $(get-date).AddMinutes($Settime)

#Set timer in seconds for later calculation

$SettimeInSec =[int]"$Settime" * "60"

#Popup with three options to comfirm if to display the terminal(question mark, and box appears in a topmost window)

$Decision = $wshell.Popup("Want to mininize the terminal? Or hit Cancel to exit",0,"^_^",0x3 + 0x20 + 0x1000)

#Switch statement re-route the action

switch ($Decision)

{

6{$wshell.SendKeys("% n")}

7{Out-Null}

2{exit}

}

Start-Sleep -Milliseconds 200

#Popup for last comfirmation

$wshell.Popup("You will get a popup reminder in $Settime minutes",60,"^_^",0x40) | Out-Null

#Display initial message in terminal

Write-host "Timer voided if this terminal is closed"

Write-host "Time remaining: $Settime minutes"

#Loop, aim to display remaining time every minute

while ($SettimeInSec -ge 60)

{

#Loop to display remaining time after 60 sec

Start-Sleep -Seconds 60

#Set decrement every 60 sec

$SettimeInSec-=60

#Recalclate remaining time in minutes for display

$SettimeInMin =[int]"$SettimeInSec" / "60"

#Display remaining time in terminal

if ($SettimeInMin -le 1)

{Write-host "Time remaining: $SettimeInMin minute"}

else

{Write-host "Time remaining: $SettimeInMin minutes"}

}

#Final popup when time is reached

Start-Sleep -Seconds $SettimeInSec; $wshell.Popup("It's Time!",0,"^_^",0x40) | Out-Null


exit


