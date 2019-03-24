#NoEnv
#SingleInstance, Force
#Persistent
#MaxThreadsPerHotkey, 1
Process, Priority,, High
SendMode Input
SetWorkingDir %A_ScriptDir%
try
{
    errornum := %1%
}
catch
{
    MsgBox, Nothing passed
    errornum := "Unknown error"
}
errorarray := ["GlyphClientApp.exe (Trove Dashboard) could not be found!`nEdit line 293 of Glyph_Login.ahk to your Trove directory","You need to be connected to the internet to login to Glyph!","You need to be connected to the internet to login to Glyph!`n(on reconnect gui will update)"]

if (errornum)  ;If ran with error passed, assign errormessage
{
    errordisplay := errorarray[errornum]
}
else
{
    errordisplay := "Invalid error passed"  ;else display invalid
}

Gui, Margin, 0, 0
Gui, Color, Black
Gui, Font, cWhite s12 bold, Arial
Gui, Add, Text,x1 y1 w58 h23, Error:

Gui, Add, Text,x1 y24 vplaceholder, %errordisplay%
Gui, Font, cWhite s6 bold, Arial
Gui, Add, text, ,(Press F4 to kill all related instances)
Gui, Show, AutoSize
return


$*F4::ExitApp