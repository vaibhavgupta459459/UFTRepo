Systemutil.Run "notepad.exe"
Call NotepadTest("TestFile")

Public Function NotepadTest(sFileName)

Set objNotpad = Window("regexpwndtitle:=Notepad","regexpwndclass:=Notepad")
objNotpad.WinEditor("nativeclass:=Edit").Type "Hello Vaibhav"
objNotpad.WinEditor("nativeclass:=Edit").Type micReturn
objNotpad.WinEditor("nativeclass:=Edit").Type "Good Morning"

'Saving the notepad
objNotpad.WinEditor("nativeclass:=Edit").Type micCtrlDwn + "s" +micCtrlup

'Saving with a filename
objNotpad.Dialog("text:=Save As","nativeclass:=#32770").winEdit("nativeclass:=Edit","attached text:=File name:").Set "C:\RobotFrameworkGit\UFTTest\NotepadFiles" & sFileName
objNotpad.Dialog("text:=Save As","nativeclass:=#32770").winbutton("text:=&save","nativeclass:=Button").Click

If objNotpad.Dialog("text:=Save As","nativeclass:=#32770").Dialog("regexpwndtitle:=Confirm Save As").Exist(3) Then
objNotpad.Dialog("text:=Save As","nativeclass:=#32770").Dialog("regexpwndtitle:=Confirm Save As").WinButton("regexpwndtitle:=&Yes").Click
End If

objNotpad.Close
Set objNotpad = nothing
End Function