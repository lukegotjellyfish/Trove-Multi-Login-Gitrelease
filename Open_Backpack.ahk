#NoEnv
#SingleInstance, Force
SendMode Input	; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
SetControlDelay -1

F3::
{
	loop, 30
	{
		clientnum := "Client" . A_Index
		if WinExist(clientnum)
		{
		ControlSend,, b, %clientnum%
		Sleep, 200
		}
	}
	ExitApp
}


$*F4::ExitApp