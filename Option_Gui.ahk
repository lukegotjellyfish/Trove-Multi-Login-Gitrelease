#NoEnv
#SingleInstance, Force
SendMode Input	; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
SetControlDelay -1
DetectHiddenWindows, On

SetTimer, check_main, 5000

thing1status := %1%
thing2status := %2%
thing3status := %3%

Transparency := 160
FontSize := 10
Gui, +AlwaysOnTop -Caption +Owner +LastFound +E0x20
Gui, Margin, 0, 0
Gui, Color, Grey
Gui, Font, cWhite s%FontSize% bold, Arial
Gui, Add, Text, x13 y13 w110 h20, Open backpack:
Gui, Add, Text, x130 y13 w10 h20 +Border vthing1status
Gui, Add, Text, x13 y43 w110 h20, Launch FB:
Gui, Add, Text, x130 y43 w10 h20 +Border vthing2status
Gui, Add, Text, x13 y73 w110 h20, Restart script:
Gui, Add, Text, x130 y73 w10 h20 +Border vthing3status
WinSet, Transparent, %Transparency%
Gui, Show, x0 y0 h106 w158

GuiControl,     ,thing1status, %thing1status%
GuiControl,     ,thing2status, %thing2status%
GuiControl,     ,thing3status, %thing3status%
GuiControl,     ,thing4status, %thing4status%
Gui, Show, x0 y0 h106 w158

check_main:
{
	if !(WinExist("Glyph_Login.ahk"))
	{
		ExitApp
	}
}


$*F4::ExitApp