Set objFSO = CreateObject("Scripting.FileSystemObject")
strCurrentFolder = objFSO.GetAbsolutePathName(".")
strScriptPath = strCurrentFolder & "\Quang.ps1"
Set objShell = CreateObject("WScript.Shell")
objShell.Run "powershell -Command ""Start-Process 'powershell.exe' -ArgumentList '-NoProfile -WindowStyle Hidden -executionpolicy bypass -noninteractive -file """ & strScriptPath & """' -Verb RunAs", 1, True

