/*
Comment section:
- Made by BLURREDDOGE / JELLYMAN123
Copyright 2018, Luke Roper, All rights reserved.
- https://www.gov.uk/copyright 
- You are free to edit this but under no circumstances, without my written permission, are you allowed to redistribute this code yourself.
*/
 
; Global vars for user optimization
Global normal_sleep ;delays used throughout the script to make it work
normal_sleep := 100
 
Global delay_time_in_ms ;delay after each keypress
delay_time_in_ms := 10
 
Global wait_for_login ;delay for allowing Glyph to login
wait_for_login := 1700
 
Global wait_for_trove_to_open ;delay for allowing Trove to open
wait_for_trove_to_open := 5000

Global how_long_until_restart ;delay (1hour) for how long to wait before restarting
how_long_until_restart = 3600000 ;3600000
 
 
if FileExist("database.txt")
{
	Array := []
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
	}
}
SetTitleMatchMode, 2
SetControlDelay -1
SetKeyDelay, %delay_time_in_ms%, 5 
 
if !WinExist("Glyph")
{
	MsgBox,, Error,
	(
	GlyphClient needs to be running!
	
	  Will now run Glyph
	), 1
	RunWait, GlyphClientApp, C:\Program Files (x86)\Steam\steamapps\common\Trove
}

;############################################################################################################
Gui, Add, Tab, x-6 y0 w250 h160, Launch Options|Info
Gui,+AlwaysOnTop

Gui, Tab, Launch Options
Gui, Add, CheckBox, x32 y29 w150 h20 vOpenBackpack, Open backpack on launch
Gui, Add, CheckBox, x32 y48 w150 h30 vLaunchFishingBot, Start Nippy's fishing bot upon launch
Gui, Add, CheckBox, x32 y80 w150 h30 vRestartEveryHour, Restart clients every hour
Gui, Add, Button, x22 y109 w200 h40 glaunchthemainscript, Launch

Gui, Tab, Info
Gui, Add, Text, x12 y29 w220 h70, Made by BLURREDDOGE / JELLYMAN123                                                                      Copyright 2018`, Luke Roper`, All rights reserved. - https://www.gov.uk/copyright
Gui, Add, Text, x12 y99 w220 h40 +Border, - You are free to edit this but under no circumstances`, without my written permission`, are you allowed to redistribute this code yourself.
Gui, Show, x100 y225 h158 w240, Launcher
return

launchthemainscript:
Gui, Submit
if RestartEveryHour = 1
	{
		global RestartEveryDelay
		RestartEveryDelay = 1
	}
if OpenBackpack = 1
	{
		global OpenBackpack 
		OpenBackpack = 1
	}
if LaunchFishingBot = 1
	{
		global LaunchFishingBot
		LaunchFishingBot = 1
	}
;############################################################################################################
	MsgBox,0,Emails,
	( 
	
	            Emails entered:
				
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
	), 0.6
 
If RestartEveryDelay = 1
{
	loop
	{
		BlockInput, On
		window_setup() ;the logging in part
		Sleep, %normal_sleep%
		if LaunchFishingBot
			{
				Send, ^{Numpad1}
			}
		if OpenBackpack
		{
			open_backpacks_properly_baka()
		}
		BlockInput, Off
		MsgBox,,, Finished, 1
		Sleep, %how_long_until_restart% ;3600000ms =  3600s = 60m = 1h
		number_on_loop = 1
		loop 12
		{
			WinKill, TroveClient%number_on_loop%
			number_on_loop += 1
		}
	}
}
Else if !(RestartEveryDelay)
	{
		BlockInput, On
		window_setup()
		Sleep, %normal_sleep%
		if LaunchFishingBot
			{
				Send, ^{Numpad1}
			}
		if OpenBackpack
		{
			open_backpacks_properly_baka()
		}
		BlockInput, Off
		MsgBox,,, Finished, 1
		ExitApp
	}
ExitApp
}
 
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
 
	;#################################################  ####################
	;                    Writing variables to file
	;#################################################  ####################
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
 
 
window_setup()
{
	runnum = 1
	if Email_Twelve
	{
		if (runnum = 1)
		{
			open_login()
			login_account(1)
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, -7, 0, 495, 355 ;1ST LINE
			WinSetTitle, %wintitle%,, TroveClient1
			runnum += 1
			Sleep, %normal_sleep%
		}
		if (runnum = 2)
		{
			open_login()
			login_account(2) 
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, 473, 0, 495, 355
			WinSetTitle, %wintitle%,, TroveClient2
			runnum += 1 
			Sleep, %normal_sleep%
		}
		
		if (runnum = 3)
		{
			open_login()
			login_account(3) 
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, 953, 0, 495, 355
			WinSetTitle, %wintitle%,, TroveClient3
			runnum += 1 
			Sleep, %normal_sleep%
		}
				
		if (runnum = 4)
		{
			open_login()
			login_account(4) 
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, 1433, 0, 495, 355
			WinSetTitle, %wintitle%,, TroveClient4
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 5)
		{
			open_login()
			login_account(5) 
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, -7, 345, 495, 355 ;2ND LINE
			WinSetTitle, %wintitle%,, TroveClient5
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 6)
		{
			open_login()
			login_account(6) 
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, 473, 345, 495, 355
			WinSetTitle, %wintitle%,, TroveClient6
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 7)
		{
			open_login()
			login_account(7)
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, 953, 345, 495, 355
			WinSetTitle, %wintitle%,, TroveClient7
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 8)
		{
			open_login()
			login_account(8) 
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, 1433, 345, 495, 355
			WinSetTitle, %wintitle%,, TroveClient8
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 9)
		{
			open_login()
			login_account(9) 
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, -7, 690, 495, 355 ;3RD LINE
			WinSetTitle, %wintitle%,, TroveClient9
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 10)
		{
			open_login()
			login_account(10) 
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, 473, 690, 485, 355
			WinSetTitle, %wintitle%,, TroveClient10
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 11)
		{
			open_login()
			login_account(11) 
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, 953, 690, 485, 355
			WinSetTitle, %wintitle%,, TroveClient11
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 12)
		{
			open_login()
			login_account(12) 
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			}
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, 1443, 690, 485, 355
			WinSetTitle, %wintitle%,, TroveClient12
			runnum += 1 
			Sleep, %normal_sleep%
		}
		has_twelve_been_run = 1
	}
	if Email_Eleven
	{
		if (!has_twelve_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				}
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 0, 495, 355 ;1ST LINE
				WinSetTitle, %wintitle%,, TroveClient1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				open_login()
				login_account(2)
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				}
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 473, 0, 495, 355
				WinSetTitle, %wintitle%,, TroveClient2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				open_login()
				login_account(3)
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 953, 0, 495, 355
				WinSetTitle, %wintitle%,, TroveClient3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				open_login()
				login_account(4) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1433, 0, 495, 355
				WinSetTitle, %wintitle%,, TroveClient4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				open_login()
				login_account(5) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 345, 495, 355 ;2ND LINE
				WinSetTitle, %wintitle%,, TroveClient5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				open_login()
				login_account(6) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 473, 345, 495, 355
				WinSetTitle, %wintitle%,, TroveClient6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 7)
			{
				open_login()
				login_account(7) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 953, 345, 495, 355
				WinSetTitle, %wintitle%,, TroveClient7
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 8)
			{
				open_login()
				login_account(8) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1433, 345, 495, 355
				WinSetTitle, %wintitle%,, TroveClient8
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 9)
			{
				open_login()
				login_account(9) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 690, 495, 355 ;3RD LINE
				WinSetTitle, %wintitle%,, TroveClient9
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 10)
			{
				open_login()
				login_account(10) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 473, 690, 485, 355
				WinSetTitle, %wintitle%,, TroveClient10
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 11)
			{
				open_login()
				login_account(11) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 944, 690, 983, 355 ;Longer than usual
				WinSetTitle, %wintitle%,, TroveClient11
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_eleven_been_run = 1
		}
	}
	if Email_Ten
	{
		if (!has_eleven_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 0, 495, 355 ;1ST LINE
				WinSetTitle, %wintitle%,, TroveClient1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				open_login()
				login_account(2) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 473, 0, 495, 355
				WinSetTitle, %wintitle%,, TroveClient2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				open_login()
				login_account(3) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 953, 0, 495, 355
				WinSetTitle, %wintitle%,, TroveClient3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				open_login()
				login_account(4) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1433, 0, 495, 355
				WinSetTitle, %wintitle%,, TroveClient4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				open_login()
				login_account(5) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 345, 495, 355 ;2ND LINE
				WinSetTitle, %wintitle%,, TroveClient5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				open_login()
				login_account(6) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 473, 345, 495, 355
				WinSetTitle, %wintitle%,, TroveClient6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 7)
			{
				open_login()
				login_account(7) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 953, 345, 495, 355
				WinSetTitle, %wintitle%,, TroveClient7
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 8)
			{
				open_login()
				login_account(8) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1433, 345, 495, 355
				WinSetTitle, %wintitle%,, TroveClient8
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 9)
			{
				open_login()
				login_account(9) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 690, 970, 355 ;3RD LINE
				WinSetTitle, %wintitle%,, TroveClient9
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 10)
			{
				open_login()
				login_account(10) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 948, 690, 979, 355 ;Longer than usual
				WinSetTitle, %wintitle%,, TroveClient10
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_ten_been_run = 1
		}
	}
	if Email_Nine
	{
		if (!has_ten_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 0, 655, 355 ;1ST LINE
				WinSetTitle, %wintitle%,, TroveClient1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				open_login()
				login_account(2) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 633, 0, 655, 355
				WinSetTitle, %wintitle%,, TroveClient2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				open_login()
				login_account(3) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1273, 0, 655, 355
				WinSetTitle, %wintitle%,, TroveClient3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				open_login()
				login_account(4) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 347, 655, 355 ;2ND LINE
				WinSetTitle, %wintitle%,, TroveClient4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				open_login()
				login_account(5) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 633, 347, 655, 355
				WinSetTitle, %wintitle%,, TroveClient5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				open_login()
				login_account(6) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1273, 347, 655, 355
				WinSetTitle, %wintitle%,, TroveClient6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 7)
			{
				open_login()
				login_account(7) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 694, 655, 355 ;3RD LINE
				WinSetTitle, %wintitle%,, TroveClient7
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 8)
			{
				open_login()
				login_account(8) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 633, 694, 655, 355
				WinSetTitle, %wintitle%,, TroveClient8
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 9)
			{
				open_login()
				login_account(9) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1273, 694, 655, 355
				WinSetTitle, %wintitle%,, TroveClient9
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_nine_been_run = 1
		}
	}
	if Email_Eight
	{
		if (!has_nine_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 0, 500, 540 ;1ST LINE
				WinSetTitle, %wintitle%,, TroveClient1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				open_login()
				login_account(2) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 478, 0, 500, 540 ;+489
				WinSetTitle, %wintitle%,, TroveClient2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				open_login()
				login_account(3) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 963, 0, 500, 540
				WinSetTitle, %wintitle%,, TroveClient3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				open_login()
				login_account(4) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1448, 0, 500, 540
				WinSetTitle, %wintitle%,, TroveClient4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				open_login()
				login_account(5) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 530, 500, 540 ;2ND LINE
				WinSetTitle, %wintitle%,, TroveClient5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				open_login()
				login_account(6) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 478, 530, 500, 540 ;+489
				WinSetTitle, %wintitle%,, TroveClient6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 7)
			{
				open_login()
				login_account(7) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 963, 530, 500, 540
				WinSetTitle, %wintitle%,, TroveClient7
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 8)
			{
				open_login()
				login_account(8) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1448, 530, 500, 540
				WinSetTitle, %wintitle%,, TroveClient8
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_eight_been_run = 1
		}
	}
	if Email_Seven
	{
		if (!has_eight_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 0, 970, 355 ;1ST LINE
				WinSetTitle, %wintitle%,, TroveClient1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				open_login()
				login_account(2) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 948, 0, 979, 355 ;Longer than usual
				WinSetTitle, %wintitle%,, TroveClient2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				open_login()
				login_account(3) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 345, 970, 355 ;2ND LINE
				WinSetTitle, %wintitle%,, TroveClient3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				open_login()
				login_account(4) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 948, 345, 979, 355
				WinSetTitle, %wintitle%,, TroveClient4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				open_login()
				login_account(5) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 692, 655, 357 ;3RD LINE
				WinSetTitle, %wintitle%,, TroveClient5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				open_login()
				login_account(6) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 633, 692, 655, 357
				WinSetTitle, %wintitle%,, TroveClient6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 7)
			{
				open_login()
				login_account(7) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1273, 692, 655, 357
				WinSetTitle, %wintitle%,, TroveClient7
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_seven_been_run = 1
		}
	}
	if Email_Six
	{
		if (!has_seven_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 0, 970, 355 ;1ST LINE
				WinSetTitle, %wintitle%,, TroveClient1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				open_login()
				login_account(2) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 948, 0, 979, 355 ;Longer than usual
				WinSetTitle, %wintitle%,, TroveClient2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				open_login()
				login_account(3) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 345, 970, 355 ;2ND LINE
				WinSetTitle, %wintitle%,, TroveClient3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				open_login()
				login_account(4) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 948, 345, 979, 355 ;Longer than usual
				WinSetTitle, %wintitle%,, TroveClient4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				open_login()
				login_account(5) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 690, 970, 355 ;3RD LINE
				WinSetTitle, %wintitle%,, TroveClient5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				open_login()
				login_account(6) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 948, 690, 979, 355 ;Longer than usual
				WinSetTitle, %wintitle%,, TroveClient6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_six_been_run = 1
		}
	}
	if Email_Five
	{
		if (!has_six_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 0, 970, 355 ;1ST LINE
				WinSetTitle, %wintitle%,, TroveClient1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				open_login()
				login_account(2) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 948, 0, 979, 355 ;Longer than usual
				WinSetTitle, %wintitle%,, TroveClient2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				open_login()
				login_account(3) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 345, 970, 355 ;2ND LINE
				WinSetTitle, %wintitle%,, TroveClient3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				open_login()
				login_account(4) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 948, 345, 979, 355 ;Longer than usual
				WinSetTitle, %wintitle%,, TroveClient4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				open_login()
				login_account(5) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 690, 970, 355 ;3RD LINE
				WinSetTitle, %wintitle%,, TroveClient5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_five_been_run = 1
		}
	}
	if Email_Four
	{
		if (!has_five_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 0, 975, 527 ;1ST LINE
				WinSetTitle, %wintitle%,, TroveClient1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				open_login()
				login_account(2) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 953, 0, 975, 527
				WinSetTitle, %wintitle%,, TroveClient2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 3)
			{
				open_login()
				login_account(3) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 517, 975, 527 ;2ND LINE
				WinSetTitle, %wintitle%,, TroveClient3
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 4)
			{
				open_login()
				login_account(4) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 953, 517, 975, 527
				WinSetTitle, %wintitle%,, TroveClient4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_four_been_run = 1
		}
	}
	if Email_Three
	{
		if (!has_four_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 0, 975, 527 ;1ST LINE
				WinSetTitle, %wintitle%,, TroveClient1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				open_login()
				login_account(2) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 953, 0, 975, 527
				WinSetTitle, %wintitle%,, TroveClient2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 3)
			{
				open_login()
				login_account(3) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 517, 1935, 527 ;2ND LINE
				WinSetTitle, %wintitle%,, TroveClient3
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_three_been_run = 1
		}
	}
	if Email_Two
	{
		if (!has_three_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 0, 975, 1054 ;1ST LINE
				WinSetTitle, %wintitle%,, TroveClient1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				open_login()
				login_account(2) 
				WinWaitActive, Trove,, 3
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, 3
				} 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 953, 0, 975, 1054
				WinSetTitle, %wintitle%,, TroveClient2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_two_been_run = 1
		}
	}
	if Email_One
	{
		if (!has_two_been_run)
		{
			open_login()
			login_account(1) 
			WinWaitActive, Trove,, 3
			if ErrorLevel
			{
				ControlClick, x430 y530, Glyph
				WinWaitActive, Trove,, 3
			} 
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, -7, 0, 975, 1054 ;1ST LINE
			WinSetTitle, %wintitle%,, TroveClient1
		}
	}
}


;#####################################################################################

open_login()
{
	ControlClick, x1065 y20, Glyph ; Login...
	Sleep, %normal_sleep%
	ControlSend,, {down down}{down up}, Glyph
	Sleep, %normal_sleep%
	ControlClick, x1065 y20, Glyph ; Login...
	Sleep, %normal_sleep%
	ControlSend,, {down down}{down up}, Glyph
	Sleep, %normal_sleep%
}


login_account(num) 
{
	if num = 1
		{
		ControlClick, x155 y253, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x155 y253, Вход в систему Glyph   ;to make sure any text left behind is deleted
		Sleep, %normal_sleep%
		ControlClick, x155 y253, Вход в систему Glyph
		Sleep, %normal_sleep%
		
		ControlSend,, %Email_One%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_One%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph ; Returing to Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2 ; Wait for menu to go away
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login	
		}
	if num = 2
		{
		ControlSend,, %Email_Two%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Two%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 3
		{
		ControlSend,, %Email_Three%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Three%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 4
		{
		ControlSend,, %Email_Four%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Four%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 5
		{
		ControlSend,, %Email_Five%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Five%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 6
		{
		ControlSend,, %Email_Six%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Six%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 7
		{
		ControlSend,, %Email_Seven%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Seven%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 8
		{
		ControlSend,, %Email_Eight%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Eight%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 9
		{
		ControlSend,, %Email_Nine%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Nine%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 10
		{
		ControlSend,, %Email_Ten%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Ten%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 11
		{
		ControlSend,, %Email_Eleven%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Eleven%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 12
		{
		ControlSend,, %Email_Twelve%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlClick, x147 y322, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Twelve%, Вход в систему Glyph
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Вход в систему Glyph
		WinWaitNotActive, Вход в систему Glyph,, 2
		if ErrorLevel
		{
			Sleep, %wait_for_login%
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
		Sleep, 500
}
;#####################################################################################

open_backpacks_properly_baka()
{
WinActivate, Glyph
ControlSend,, {B}, TroveClient1
Sleep, 3000
ControlSend,, {B}, TroveClient2
Sleep, 3000
ControlSend,, {B}, TroveClient3
Sleep, 3000
ControlSend,, {B}, TroveClient4
Sleep, 3000
ControlSend,, {B}, TroveClient5
Sleep, 3000
ControlSend,, {B}, TroveClient6
Sleep, 3000
ControlSend,, {B}, TroveClient7
Sleep, 3000
ControlSend,, {B}, TroveClient8
Sleep, 3000
ControlSend,, {B}, TroveClient9
Sleep, 3000
ControlSend,, {B}, TroveClient10
Sleep, 3000
ControlSend,, {B}, TroveClient11
Sleep, 3000
ControlSend,, {B}, TroveClient12
}



Esc::ExitApp