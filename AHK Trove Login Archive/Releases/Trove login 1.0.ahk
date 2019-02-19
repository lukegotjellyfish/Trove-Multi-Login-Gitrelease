]/*
Comment section:
- Made by BLURREDDOGE([url]https://www.mpgh.net/forum/member.php?u=2877154[/url]) at [url]https://www.mpgh.net[/url]!

Copyright 2018, Luke Roper, All rights reserved.

- [url]https://www.gov.uk/copyright[/url]
*/

if FileExist("database.txt")
{
	Array := [] ; or Array := Array()
	breakline = `n
	Loop, Read, database.txt
	{
		Array.Push(A_LoopReadLine)
	}
	for index, element in Array
	{
		oof := Mod(index, 2)
		if oof = 0
		{
			Passwords := Passwords . element . breakline
			if index = 2
				{
					Global Password_One
					Password_One := Password_One . element
				}
			if index = 4
				{
					Global Password_Two
					Password_Two := Password_Two . element
				}
			if index = 6
				{
					Global Password_Three
					Password_Three := Password_Three . element
				}
			if index = 8
				{
					Global Password_Four
					Password_Four := Password_Four . element
				}	
		}
		else
		{
			Emails := Emails . element . breakline
			if index = 1
				{
					Global Email_One
					Email_One := element
				}
			if index = 3
				{
					Global Email_Two
					Email_Two := element
				}
			 if index = 5
				{
					Global Email_Three
					Email_Three := element
				}	
			 if index = 7
				{
					Global Email_Four
					Email_Four := element
				}
	} ; End of Email and Password fetch
}
SetTitleMatchMode, 2
SetControlDelay -1
wait_for_login := 3000
wait_for_trove_to_open := 5000


	;##############################################
	;                 Open login 1                #
	;##############################################
	ControlClick, x1065 y20, Glyph ; Login...
	Sleep, 250
	ControlSend,, {down down}{down up}, Glyph
	Sleep, 250
	ControlClick, x1065 y20, Glyph ; Login...
	Sleep, 250
	ControlSend,, {down down}{down up}, Glyph
	Sleep, 250
	;##############################################
	;               Login account 1               #
	;##############################################
	ControlSend,, %Email_One%, Glyph Login
	Sleep, 250
	ControlClick, x147 y322, Glyph Login
	Sleep, 250
	ControlSend,, %Password_One%, Glyph Login
	Sleep, 250
	ControlSend,, {enter down}{enter up}, Glyph Login ; Returing to Glyph
	Sleep, %wait_for_login% ; Wait for menu to go away
	ControlClick, x430 y530, Glyph  ;Click Play to login
	Sleep, %wait_for_trove_to_open%



;##############################################
;                 Open login  2               #
;##############################################
ControlClick, x1065 y20, Glyph ; Login...
Sleep, 250
ControlSend,, {down down}{down up}, Glyph
Sleep, 250
ControlClick, x1065 y20, Glyph ; Login...
Sleep, 250
ControlSend,, {down down}{down up}, Glyph
Sleep, 250
;##############################################
;               Login account 2               #
;##############################################
ControlSend,, %Email_Two%, Glyph Login
Sleep, 250
ControlClick, x147 y322, Glyph Login
Sleep, 200
ControlSend,, %Password_Two%, Glyph Login
Sleep, 250
ControlSend,, {enter down}{enter up}, Glyph Login
Sleep, %wait_for_login%
ControlClick, x430 y530, Glyph  ;Click Play to login
Sleep, %wait_for_trove_to_open%



	;##############################################
	;                Open login 3                 #
	;##############################################
	ControlClick, x1065 y20, Glyph ; Login...
	Sleep, 250
	ControlSend,, {down down}{down up}, Glyph
	Sleep, 250
	ControlClick, x1065 y20, Glyph ; Login...
	Sleep, 250
	ControlSend,, {down down}{down up}, Glyph
	Sleep, 250
	;##############################################
	;               Login account 3               #
	;##############################################
	ControlSend,, %Email_Three%, Glyph Login
	Sleep, 250
	ControlClick, x147 y322, Glyph Login
	Sleep, 200
	ControlSend,, %Password_Three%, Glyph Login
	Sleep, 250
	ControlSend,, {enter down}{enter up}, Glyph Login
	Sleep, %wait_for_login%
	ControlClick, x430 y530, Glyph  ;Click Play to login
	Sleep, %wait_for_trove_to_open%



;##############################################
;                 Open login 4                #
;##############################################
ControlClick, x1065 y20, Glyph ; Login...
Sleep, 250
ControlSend,, {down down}{down up}, Glyph
Sleep, 250
ControlClick, x1065 y20, Glyph ; Login...
Sleep, 250
ControlSend,, {down down}{down up}, Glyph
Sleep, 250
;##############################################
;               Login account 4               #
;##############################################
ControlSend,, %Email_Four%, Glyph Login
Sleep, 250
ControlClick, x147 y322, Glyph Login
Sleep, 200
ControlSend,, %Password_Four%, Glyph Login
Sleep, 250
ControlSend,, {enter down}{enter up}, Glyph Login
Sleep, %wait_for_login%
ControlClick, x430 y530, Glyph  ;Click Play to login
Sleep, %wait_for_trove_to_open%

ExitApp ;Accounts have been logged in, no need to keep script active
} ;If no file is detected this is skipped



	
IfNotExist, database.txt
{
	Gui, New,, GUI
	Gui, Color, red
	;Gui Group 1
	Gui, Add, groupbox, x10 y5 w180 h105
	Gui, Add, Text, x15 y15, Email 1:
	Gui, Add, Edit, w170 vEmail_One
	Gui, Add, Text, x15 y65, Password 1:
	Gui, Add, Edit, w170 Password vPassword_One

	;Gui Group 2
	Gui,add, groupbox, x10 y105 w180 h115
	Gui, Add, Text, x15 y125, Email 2:
	Gui, Add, Edit, w170 vEmail_Two
	Gui, Add, Text, x15 y175, Password 2:
	Gui, Add, Edit, w170 Password vPassword_Two

	;Gui Group 3
	Gui,add, groupbox, x10 y215 w180 h105
	Gui, Add, Text, x15 y225, Email 3:
	Gui, Add, Edit, w170 vEmail_Three
	Gui, Add, Text, x15 y275, Password 3:
	Gui, Add, Edit, w170 Password vPassword_Three

	;Gui Group 4
	Gui,add, groupbox, x10 y315 w180 h135
	Gui, Add, Text, x15 y325, Email 4:
	Gui, Add, Edit, w170 vEmail_Four
	Gui, Add, Text, x15 y375, Password 4:
	Gui, Add, Edit, w170 Password vPassword_Four
	Gui, Add, Button, Default gOK, Save Emails/Passwords to use
	Gui, Show, w205 h460
	return

	OK:
	Gui, Submit
	Gui, Destroy
	MsgBox,
	( 

	First Email: %Email_One%
	First Password: %Password_One% 

	Second Email: %Email_Two%
	Second Password: %Password_Two%

	Third Email: %Email_Three%
	Third Password: %Password_Three%

	Fourth Email: %Email_Four%
	Fourth Password: %Password_Four%
	)
	;Writes emails+ps to file

	;#####################################################################
	;                    Writing variables to file
	;#####################################################################
	FileAppend, %Email_One%`n, database.txt
	FileAppend, %Password_One%`n, database.txt
	FileAppend, %Email_Two%`n, database.txt
	FileAppend, %Password_Two%`n, database.txt
	FileAppend, %Email_Three%`n, database.txt
	FileAppend, %Password_Three%`n, database.txt
	FileAppend, %Email_Four%`n, database.txt
	FileAppend, %Password_Four%`n, database.txt
	;Run, database.txt
	;return
	ExitApp
}