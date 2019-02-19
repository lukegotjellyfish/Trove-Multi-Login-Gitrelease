/*
Comment section:
- Made by BLURREDDOGE(https://www.mpgh.net/forum/member.php?u=2877154) at https://www.mpgh.net!

Copyright 2018, Luke Roper, All rights reserved.

- https://www.gov.uk/copyright
*/

; Global vars for user optimization
Global wait_for_login
wait_for_login := 1700

Global wait_for_trove_to_open
wait_for_trove_to_open := 5000



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
			Passwords := element . breakline
			if index = 2
				{
					Global Password_One
					Password_One := element
				}
			if index = 4
				{
					Global Password_Two
					Password_Two := element
				}
			if index = 6
				{
					Global Password_Three
					Password_Three := element
				}
			if index = 8
				{
					Global Password_Four
					Password_Four := element
				}	
			if index = 10
				{
					Global Password_Five
					Password_Five := element
				}
			if index = 12
				{
					Global Password_Six
					Password_Six := element
				}
			if index = 14
				{
					Global Password_Seven
					Password_Seven := element
				}
			if index = 16
				{
					Global Password_Eight
					Password_Eight := element
				}
			if index = 18
				{
					Global Password_Nine
					Password_Nine := element
				}
			if index = 20
				{
					Global Password_Ten
					Password_Ten := element
				}
			if index = 22
				{
					Global Password_Eleven
					Password_Eleven := element
				}
			if index = 24
				{
					Global Password_Twelve
					Password_Twelve := element
				}
		}
		else
		{
			Emails := element . breakline
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
			if index = 9
				{
					Global Email_Five
					Email_Five := element
				}
			if index = 11
				{
					Global Email_Six
					Email_Six := element
				}
			if index = 13
				{
					Global Email_Seven
					Email_Seven := element
				}
			if index = 15
				{
					Global Email_Eight
					Email_Eight := element
				}
			if index = 17
				{
					Global Email_Nine
					Email_Nine := element
				}
			if index = 19
				{
					Global Email_Ten
					Email_Ten := element
				}
			if index = 21
				{
					Global Email_Eleven
					Email_Eleven := element
				}
			if index = 23
				{
					Global Email_Twelve
					Email_Twelve := element
				}
	} ; End of Email and Password fetch
}
SetTitleMatchMode, 2
SetControlDelay -1
SetKeyDelay, 10, 5 

	MsgBox,
	( 

	 1: %Email_One%
	 2: %Email_Two%
	 3: %Email_Three%
	 4: %Email_Four%
	 5: %Email_Five%
	 6: %Email_Six%
	 7: %Email_Seven%
	 8: %Email_Eight%
	 9: %Email_Nine%
	10: %Email_Ten%
	11: %Email_Eleven%
	12: %Email_Twelve%
	)

	If (!Email_One)
		return
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


If (!Email_Two)
	return
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


	If (!Email_Three)
		return
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


If (!Email_Four)
	return
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


	If (!Email_Five)
		return
	;##############################################
	;                Open login 5                 #
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
	;               Login account 5               #
	;##############################################
	ControlSend,, %Email_Five%, Glyph Login
	Sleep, 250
	ControlClick, x147 y322, Glyph Login
	Sleep, 200
	ControlSend,, %Password_Five%, Glyph Login
	Sleep, 250
	ControlSend,, {enter down}{enter up}, Glyph Login
	Sleep, %wait_for_login%
	ControlClick, x430 y530, Glyph  ;Click Play to login
	Sleep, %wait_for_trove_to_open%

	
If (!Email_Six)
	return
;##############################################
;                 Open login 6                #
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
;               Login account 6               #
;##############################################
ControlSend,, %Email_Six%, Glyph Login
Sleep, 250
ControlClick, x147 y322, Glyph Login
Sleep, 200
ControlSend,, %Password_Six%, Glyph Login
Sleep, 250
ControlSend,, {enter down}{enter up}, Glyph Login
Sleep, %wait_for_login%
ControlClick, x430 y530, Glyph  ;Click Play to login
Sleep, %wait_for_trove_to_open%


If (!Email_Seven)
	return
	;##############################################
	;                Open login 7                 #
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
	;               Login account 7               #
	;##############################################
	ControlSend,, %Email_Seven%, Glyph Login
	Sleep, 250
	ControlClick, x147 y322, Glyph Login
	Sleep, 200
	ControlSend,, %Password_Seven%, Glyph Login
	Sleep, 250
	ControlSend,, {enter down}{enter up}, Glyph Login
	Sleep, %wait_for_login%
	ControlClick, x430 y530, Glyph  ;Click Play to login
	Sleep, %wait_for_trove_to_open%

	
If (!Email_Eight)
	return
;##############################################
;                 Open login 8                #
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
;               Login account 8               #
;##############################################
ControlSend,, %Email_Eight%, Glyph Login
Sleep, 250
ControlClick, x147 y322, Glyph Login
Sleep, 200
ControlSend,, %Password_Eight%, Glyph Login
Sleep, 250
ControlSend,, {enter down}{enter up}, Glyph Login
Sleep, %wait_for_login%
ControlClick, x430 y530, Glyph  ;Click Play to login
Sleep, %wait_for_trove_to_open%


If (!Email_Nine)
	return
	;##############################################
	;                Open login 9                 #
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
	;               Login account 9               #
	;##############################################
	ControlSend,, %Email_Nine%, Glyph Login
	Sleep, 250
	ControlClick, x147 y322, Glyph Login
	Sleep, 200
	ControlSend,, %Password_Nine%, Glyph Login
	Sleep, 250
	ControlSend,, {enter down}{enter up}, Glyph Login
	Sleep, %wait_for_login%
	ControlClick, x430 y530, Glyph  ;Click Play to login
	Sleep, %wait_for_trove_to_open%


If (!Email_Ten)
	return
;##############################################
;                 Open login 10                #
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
;               Login account 10               #
;##############################################
ControlSend,, %Email_Ten%, Glyph Login
Sleep, 250
ControlClick, x147 y322, Glyph Login
Sleep, 200
ControlSend,, %Password_Ten%, Glyph Login
Sleep, 250
ControlSend,, {enter down}{enter up}, Glyph Login
Sleep, %wait_for_login%
ControlClick, x430 y530, Glyph  ;Click Play to login
Sleep, %wait_for_trove_to_open%


If (!Email_Eleven)
	return
	;##############################################
	;                Open login 11                 #
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
	;               Login account 11               #
	;##############################################
	ControlSend,, %Email_Eleven%, Glyph Login
	Sleep, 250
	ControlClick, x147 y322, Glyph Login
	Sleep, 200
	ControlSend,, %Password_Eleven%, Glyph Login
	Sleep, 250
	ControlSend,, {enter down}{enter up}, Glyph Login
	Sleep, %wait_for_login%
	ControlClick, x430 y530, Glyph  ;Click Play to login
	Sleep, %wait_for_trove_to_open%


If (!Email_Twelve)
	return
;##############################################
;                 Open login 12                #
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
;               Login account 12               #
;##############################################
ControlSend,, %Email_Twelve%, Glyph Login
Sleep, 250
ControlClick, x147 y322, Glyph Login
Sleep, 200
ControlSend,, %Password_Twelve%, Glyph Login
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
	Gui, Color, A9A9A9 ;hex for dark grey

	;Gui Group 1
	Gui, Add, groupbox, x10 y5 w180 h105
	Gui, Add, Text, x15 y15, Email 1:
	Gui, Add, Edit, w170 vEmail_One
	Gui, Add, Text, x15 y65, Password 1:
	Gui, Add, Edit, w170 Password vPassword_One
	
		;Gui Group 7
		Gui, Add, groupbox, x200 y5 w180 h105
		Gui, Add, Text, x205 y15, Email 7:
		Gui, Add, Edit, w170 vEmail_Seven
		Gui, Add, Text, x205 y65, Password 7:
		Gui, Add, Edit, w170 Password vPassword_Seven

	;Gui Group 2
	Gui,add, groupbox, x10 y110 w180 h105
	Gui, Add, Text, x15 y120, Email 2:
	Gui, Add, Edit, w170 vEmail_Two
	Gui, Add, Text, x15 y170, Password 2:
	Gui, Add, Edit, w170 Password vPassword_Two

		;Gui Group 8
		Gui, Add, groupbox, x200 y110 w180 h105
		Gui, Add, Text, x205 y120, Email 8:
		Gui, Add, Edit, w170 vEmail_Eight
		Gui, Add, Text, x205 y170, Password 8:
		Gui, Add, Edit, w170 Password vPassword_Eight

	;Gui Group 3
	Gui,add, groupbox, x10 y215 w180 h105
	Gui, Add, Text, x15 y225, Email 3:
	Gui, Add, Edit, w170 vEmail_Three
	Gui, Add, Text, x15 y275, Password 3:
	Gui, Add, Edit, w170 Password vPassword_Three

		;Gui Group 9
		Gui, Add, groupbox, x200 y215 w180 h105
		Gui, Add, Text, x205 y225, Email 9:
		Gui, Add, Edit, w170 vEmail_Nine
		Gui, Add, Text, x205 y275, Password 9:
		Gui, Add, Edit, w170 Password vPassword_Nine

	;Gui Group 4
	Gui,add, groupbox, x10 y320 w180 h105
	Gui, Add, Text, x15 y330, Email 4:
	Gui, Add, Edit, w170 vEmail_Four
	Gui, Add, Text, x15 y380, Password 4:
	Gui, Add, Edit, w170 Password vPassword_Four

		;Gui Group 10
		Gui, Add, groupbox, x200 y320 w180 h105
		Gui, Add, Text, x205 y330, Email 10:
		Gui, Add, Edit, w170 vEmail_Ten
		Gui, Add, Text, x205 y380, Password 10:
		Gui, Add, Edit, w170 Password vPassword_Ten

	;Gui Group 5
	Gui,add, groupbox, x10 y425 w180 h105
	Gui, Add, Text, x15 y435, Email 5:
	Gui, Add, Edit, w170 vEmail_Five
	Gui, Add, Text, x15 y485, Password 5:
	Gui, Add, Edit, w170 Password vPassword_Five

		;Gui Group 11
		Gui, Add, groupbox, x200 y425 w180 h105
		Gui, Add, Text, x205 y435, Email 11:
		Gui, Add, Edit, w170 vEmail_Eleven
		Gui, Add, Text, x205 y485, Password 11:
		Gui, Add, Edit, w170 Password vPassword_Eleven

	;Gui Group 6
	Gui,add, groupbox, x10 y530 w180 h105
	Gui, Add, Text, x15 y540, Email 6:
	Gui, Add, Edit, w170 vEmail_Six
	Gui, Add, Text, x15 y590, Password 6:
	Gui, Add, Edit, w170 Password vPassword_Six

		;Gui Group 12
		Gui, Add, groupbox, x200 y530 w180 h135
		Gui, Add, Text, x205 y540, Email 12:
		Gui, Add, Edit, w170 vEmail_Twelve
		Gui, Add, Text, x205 y590, Password 12:
		Gui, Add, Edit, w170 Password vPassword_Twelve
		Gui, Add, Button, Default gOK, Save Emails/Passwords to use
		Gui, Show, w395 h675

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
	
	Fith Email: %Email_Five%
	Fith Password: %Password_Five%
	
	Sixth Email: %Email_Six%
	Sixth Password: %Password_Six%
	
	Seventh Email: %Email_Seven%
	Seventh Password: %Password_Seven%
	
	Eighth Email: %Email_Eight%
	Eigth Password: %Password_Eight%
	
	Ninth Email: %Email_Nine%
	Ninth Password: %Password_Nine%
	
	Tenth Email: %Email_Ten%
	Tenth Password: %Password_Ten%
	
	Eleventh Email: %Email_Eleven%
	Eleventh Password: %Password_Eleven%
	
	Twelth Email: %Email_Twelve%
	Twelth Password: %Password_Twelve%
	)
	;Writes emails+ps to file

	;#####################################################################
	;                    Writing variables to file
	;#####################################################################
	If (!Email_One)
		ExitApp
	FileAppend, %Email_One%`n, database.txt
	FileAppend, %Password_One%`n, database.txt
	If (!Email_Two)
		ExitApp
	FileAppend, %Email_Two%`n, database.txt
	FileAppend, %Password_Two%`n, database.txt
	If (!Email_Three)
		ExitApp
	FileAppend, %Email_Three%`n, database.txt
	FileAppend, %Password_Three%`n, database.txt
	If (!Email_Four)
		ExitApp
	FileAppend, %Email_Four%`n, database.txt
	FileAppend, %Password_Four%`n, database.txt
	If (!Email_Four)
		ExitApp
	FileAppend, %Email_Five%`n, database.txt
	FileAppend, %Password_Five%`n, database.txt
	If (!Email_Six)
		ExitApp
	FileAppend, %Email_Six%`n, database.txt
	FileAppend, %Password_Six%`n, database.txt
	If (!Email_Seven)
		ExitApp
	FileAppend, %Email_Seven%`n, database.txt
	FileAppend, %Password_Seven%`n, database.txt
	If (!Email_Eight)
		ExitApp
	FileAppend, %Email_Eight%`n, database.txt
	FileAppend, %Password_Eight%`n, database.txt
	If (!Email_Nine)
		ExitApp
	FileAppend, %Email_Nine%`n, database.txt
	FileAppend, %Password_Nine%`n, database.txt
	If (!Email_Ten)
		ExitApp
	FileAppend, %Email_Ten%`n, database.txt
	FileAppend, %Password_Ten%`n, database.txt
	If (!Email_Eleven)
		ExitApp
	FileAppend, %Email_Eleven%`n, database.txt
	FileAppend, %Password_Eleven%`n, database.txt
	If (!Email_Twelve)
		ExitApp
	FileAppend, %Email_Twelve%`n, database.txt
	FileAppend, %Password_Twelve%`n, database.txt

	ExitApp
}