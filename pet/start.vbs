' Starts the pet with no console window. Uses the Python written to pythonw.txt by install.ps1, or pythonw / pyw from PATH.
Set fso = CreateObject("Scripting.FileSystemObject")
folder = fso.GetParentFolderName(WScript.ScriptFullName)
Set sh = CreateObject("WScript.Shell")
script = Chr(34) & folder & "\crab_pet.py" & Chr(34)
py = ""
If fso.FileExists(folder & "\pythonw.txt") Then
  Set f = fso.OpenTextFile(folder & "\pythonw.txt", 1)
  If Not f.AtEndOfStream Then py = Trim(f.ReadLine())
  f.Close
End If
On Error Resume Next
If py <> "" Then
  sh.Run Chr(34) & py & Chr(34) & " " & script, 0, False
Else
  sh.Run "pythonw " & script, 0, False
  If Err.Number <> 0 Then
    Err.Clear
    sh.Run "pyw " & script, 0, False
  End If
End If
