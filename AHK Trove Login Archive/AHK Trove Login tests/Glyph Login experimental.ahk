SendMode Input

/*
- Made by BLURREDDOGE / JELLYMAN123
Copyright 2018, Luke Roper, All rights reserved.
- https://www.gov.uk/copyright 
- You are free to edit this but under no circumstances, without my written permission, are you allowed to redistribute this code yourself.
*/

global normal_sleep           := 100
global wait_for_trove_to_open := 4
global delay_time_in_ms       := 50
global how_long_until_restart := 3600000

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
RunWait, GlyphClientApp.exe, C:\Program Files (x86)\Steam\steamapps\common\Trove
;############################################################################################################
Gui,+AlwaysOnTop
Gui, Add, Tab, x-6 y-2 w250 h225, Launch Options|Info|Emails

Gui, Tab, Launch Options
howlonguntilrestartseconds := Round(how_long_until_restart /= 60000, 3)
Gui, Add, CheckBox, x32 y29 w150 h20 vOpenBackpack, Open backpack on launch
Gui, Add, CheckBox, x32 y48 w150 h30 vLaunchFishingBot, Start Nippy's fishing bot upon launch
Gui, Add, CheckBox, x32 y80 w150 h30 vRestartEveryHour, Restart clients every %howlonguntilrestartseconds% minutes
Gui, Add, CheckBox, x32 y112 w150 h30 vfishing_auto_delete, Start item deleter on launch (top left corner of backpack)
Gui, Add, CheckBox, x32 y144 w150 h30 vlaunch_with_gui, Launch with GUI showing active options
Gui, Add, Button, x22 y175 w200 h40 glaunchthemainscript, Launch

Gui, Tab, Info
Gui, Add, Text, x12 y29 w220 h70, Made by BLURREDDOGE / JELLYMAN123                                                                      Copyright 2018`, Luke Roper`, All rights reserved. - https://www.gov.uk/copyright
Gui, Add, Text, x12 y99 w220 h52, - You are free to edit this but under no circumstances`, without my written permission`, are you allowed to redistribute this code yourself.

Gui, Tab, Emails
Gui, Add, Button, x22 y145 w200 h40 gshowemails, Show Emails
Gui, Show, x100 y225 h220 w240, Launcher
return

showemails:
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
	)
	return

launchthemainscript:
Gui, Submit
Gui, Destroy
;############################################################################################################
if RestartEveryHour = 1
{
	global RestartEveryDelay := 1
}
if OpenBackpack = 1
{
	global OpenBackpack := 1
}
if LaunchFishingBot = 1
{
	global LaunchFishingBot := 1
}
if fishing_auto_delete = 1
{
	global fishing_auto_delete := 1
	global OpenBackpack := 1
}
if launch_with_gui = 1
{
	Run, AutoHotkey.exe placeholder.ahk %OpenBackpack% %LaunchFishingBot% %RestartEveryHour% %fishing_auto_delete%
}
if RestartEveryDelay = 1
{
	loop
	{
		clear_email_glyph_login()
		window_setup() ;the logging in part
		Sleep, %normal_sleep%
		if (LaunchFishingBot) and !(OpenBackpack) and !(window_auto_delete)
		{
			Sleep, 9000
			Send, ^{Numpad1}
		}
		else if (LaunchFishingBot) and (OpenBackpack) and !(window_auto_delete)
		{
			open_backpacks_properly_baka(1)
		}
		else if (LaunchFishingBot) and (OpenBackpack) and (window_auto_delete)
		{
			open_backpacks_properly_baka(1)
			MsgBox,,, Press F4 to stop item deleter, 0.5
			invdelete(%passover%)
		}
		else if !(LaunchFishingBot) and (OpenBackpack) and !(window_auto_delete)
		{
			open_backpacks_properly_baka(0)
		}
		else if !(LaunchFishingBot) and !(OpenBackpack) and (window_auto_delete)
		{
			open_backpacks_properly_baka(0)
			MsgBox,,, Press F4 to stop item deleter, 0.5
			invdelete(%passover%)
		}
		else if (LaunchFishingBot) and !(OpenBackpack) and (window_auto_delete)
		{
			open_backpacks_properly_baka(1)
			MsgBox,,, Press F4 to stop item deleter, 0.5
			invdelete(%passover%)
		}
		else if !(LaunchFishingBot) and (OpenBackpack) and (window_auto_delete)
		{
			open_backpacks_properly_baka(0)
			MsgBox,,, Press F4 to stop item deleter, 0.5
			invdelete(%passover%)
		}
		if !window_auto_delete
		{
		Sleep, %how_long_until_restart% ;3600000ms =  3600s = 60m = 1h
		}
		numberonloop = 1
		loop
		{
		if numberonloop > 12
		{
			break
		}
		WinKill, Client%numberonloop%
		numberonloop += 1
		}
	}
}
Else if !(RestartEveryDelay)
	{
		clear_email_glyph_login()
		window_setup()
		Sleep, %normal_sleep%
	if (LaunchFishingBot) and !(OpenBackpack) and !(window_auto_delete)
		{
		Sleep, 9000
		Send, ^{Numpad1}
		}
	else if (LaunchFishingBot) and (OpenBackpack) and !(window_auto_delete)
		{
		open_backpacks_properly_baka(1)
		}
	else if (LaunchFishingBot) and (OpenBackpack) and (window_auto_delete)
		{
		open_backpacks_properly_baka(1)
		MsgBox,,, Press F4 to stop item deleter, 0.5
		invdelete(%passover%)
		}
	else if !(LaunchFishingBot) and (OpenBackpack) and !(window_auto_delete)
		{
		open_backpacks_properly_baka(0)
		}
	else if !(LaunchFishingBot) and !(OpenBackpack) and (window_auto_delete)
		{
		open_backpacks_properly_baka(0)
		MsgBox,,, Press F4 to stop item deleter, 0.5
		invdelete(%passover%)
		}
	else if (LaunchFishingBot) and !(OpenBackpack) and (window_auto_delete)
		{
		open_backpacks_properly_baka(1)
		MsgBox,,, Press F4 to stop item deleter, 0.5
		invdelete(%passover%)
		}
	else if !(LaunchFishingBot) and (OpenBackpack) and (window_auto_delete)
		{
		open_backpacks_properly_baka(0)
		MsgBox,,, Press F4 to stop item deleter, 0.5
		invdelete(%passover%)
		}
	ExitApp
	}
}
IfNotExist, database.txt
{
	MsgBox,,, Make sure you don't leave an email or password empty on a box with one filled otherwise the program will restart
	Gui, New,, Create Email+Password Database
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
		Gui, Add, groupbox, x200 y530 w180 h105
		Gui, Add, Text, x205 y540, Email 12:
		Gui, Add, Edit, w170 vEmail_Twelve
		Gui, Add, Text, x205 y590, Password 12:
		Gui, Add, Edit, w170 Password vPassword_Twelve
		
		Gui, Add, Button, x167 y640 gOK, Continue
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
	if !(!Email_One) and !(!Password_One)
	{
		FileAppend, %Email_One%`n, database.txt
		FileAppend, %Password_One%`n, database.txt
	}
	if !(!Email_Two) and !(!Password_Two)
	{
		FileAppend, %Email_Two%`n, database.txt
		FileAppend, %Password_Two%`n, database.txt
	}
	if !(!Email_Three) and !(!Password_Three)
	{
		FileAppend, %Email_Three%`n, database.txt
		FileAppend, %Password_Three%`n, database.txt
	}
	if !(!Email_Four) and !(!Password_Four)
	{
		FileAppend, %Email_Four%`n, database.txt
		FileAppend, %Password_Four%`n, database.txt
	}
	if !(!Email_Five) and !(!Password_Five)
	{
		FileAppend, %Email_Five%`n, database.txt
		FileAppend, %Password_Five%`n, database.txt
	}
	if !(!Email_Six) and !(!Password_Six)
	{
		FileAppend, %Email_Six%`n, database.txt
		FileAppend, %Password_Six%`n, database.txt
	}
	if !(!Email_Seven) and !(!Password_Seven)
	{
		FileAppend, %Email_Seven%`n, database.txt
		FileAppend, %Password_Seven%`n, database.txt
	}
	if !(!Email_Eight) and !(!Password_Eight)
	{
		FileAppend, %Email_Eight%`n, database.txt
		FileAppend, %Password_Eight%`n, database.txt
	}
	if !(!Email_Nine) and !(!Password_Nine)
	{
		FileAppend, %Email_Nine%`n, database.txt
		FileAppend, %Password_Nine%`n, database.txt
	}
	if !(!Email_Ten) and !(!Password_Ten)
	{
		FileAppend, %Email_Ten%`n, database.txt
		FileAppend, %Password_Ten%`n, database.txt
	}
	if !(!Email_Eleven) and !(!Password_Eleven)
	{
		FileAppend, %Email_Eleven%`n, database.txt
		FileAppend, %Password_Eleven%`n, database.txt
	}
	if !(!Email_Twelve) and !(!Password_Twelve)
	{
		FileAppend, %Email_Twelve%`n, database.txt
		FileAppend, %Password_Twelve%`n, database.txt
	}
	reload
}
 
 
window_setup()
{
	
	runnum = 1
	if Email_Twelve
	{
		if (runnum = 1)
		{
			if fishing_auto_delete = 1
				{
					Global window_auto_delete := 1
					Global passover := 12
				}
			change_account()
			login_account(1)
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(1)
				}
			}
			WinMove, Trove,, -7, 0, 495, 355 ;1ST LINE
			WinSetTitle, Trove,, Client1
			runnum += 1
			Sleep, %normal_sleep%
		}
		if (runnum = 2)
		{
			change_account()
			login_account(2) 
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(2)
				}
			}
			WinMove, Trove,, 473, 0, 495, 355
			WinSetTitle, Trove,, Client2
			runnum += 1 
			Sleep, %normal_sleep%
		}
		
		if (runnum = 3)
		{
			change_account()
			login_account(3) 
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(3)
				}
			}
			WinMove, Trove,, 953, 0, 495, 355
			WinSetTitle, Trove,, Client3
			runnum += 1 
			Sleep, %normal_sleep%
		}
				
		if (runnum = 4)
		{
			change_account()
			login_account(4) 
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(4)
				}
			}
			WinMove, Trove,, 1433, 0, 495, 355
			WinSetTitle, Trove,, Client4
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 5)
		{
			change_account()
			login_account(5) 
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(5)
				}
			}
			WinMove, Trove,, -7, 345, 495, 355 ;2ND LINE
			WinSetTitle, Trove,, Client5
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 6)
		{
			change_account()
			login_account(6) 
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(6)
				}
			}
			WinMove, Trove,, 473, 345, 495, 355
			WinSetTitle, Trove,, Client6
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 7)
		{
			change_account()
			login_account(7)
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(7)
				}
			}
			WinMove, Trove,, 953, 345, 495, 355
			WinSetTitle, Trove,, Client7
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 8)
		{
			change_account()
			login_account(8) 
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(8)
				}
			}
			WinMove, Trove,, 1433, 345, 495, 355
			WinSetTitle, Trove,, Client8
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 9)
		{
			change_account()
			login_account(9) 
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(9)
				}
			}
			WinMove, Trove,, -7, 690, 495, 355 ;3RD LINE
			WinSetTitle, Trove,, Client9
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 10)
		{
			change_account()
			login_account(10) 
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(10)
				}
			}
			WinMove, Trove,, 473, 690, 485, 355
			WinSetTitle, Trove,, Client10
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 11)
		{
			change_account()
			login_account(11) 
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(11)
				}
			}
			WinMove, Trove,, 953, 690, 485, 355
			WinSetTitle, Trove,, Client11
			runnum += 1 
			Sleep, %normal_sleep%
		}
		if (runnum = 12)
		{
			change_account()
			login_account(12) 
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(12)
				}
			}
			WinMove, Trove,, 1443, 690, 485, 355
			WinSetTitle, Trove,, Client12
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
			if fishing_auto_delete = 1
				{
					Global window_auto_delete
					window_auto_delete = 1
					Global passover = 11
				}
				change_account()
				login_account(1) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(1)
					}
				}
				WinMove, Trove,, -7, 0, 495, 355 ;1ST LINE
				WinSetTitle, Trove,, Client1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				change_account()
				login_account(2)
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(2)
					}
				}
				WinMove, Trove,, 473, 0, 495, 355
				WinSetTitle, Trove,, Client2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				change_account()
				login_account(3)
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(3)
					}
				}
				WinMove, Trove,, 953, 0, 495, 355
				WinSetTitle, Trove,, Client3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				change_account()
				login_account(4) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(4)
					}
				} 
				WinMove, Trove,, 1433, 0, 495, 355
				WinSetTitle, Trove,, Client4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				change_account()
				login_account(5) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(5)
					}
				} 
				WinMove, Trove,, -7, 345, 495, 355 ;2ND LINE
				WinSetTitle, Trove,, Client5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				change_account()
				login_account(6) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(6)
					}
				} 
				WinMove, Trove,, 473, 345, 495, 355
				WinSetTitle, Trove,, Client6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 7)
			{
				change_account()
				login_account(7) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(7)
					}
				} 
				WinMove, Trove,, 953, 345, 495, 355
				WinSetTitle, Trove,, Client7
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 8)
			{
				change_account()
				login_account(8) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(8)
					}
				} 
				WinMove, Trove,, 1433, 345, 495, 355
				WinSetTitle, Trove,, Client8
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 9)
			{
				change_account()
				login_account(9) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(9)
					}
				} 
				WinMove, Trove,, -7, 690, 495, 355 ;3RD LINE
				WinSetTitle, Trove,, Client9
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 10)
			{
				change_account()
				login_account(10) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(10)
					}
				} 
				WinMove, Trove,, 473, 690, 485, 355
				WinSetTitle, Trove,, Client10
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 11)
			{
				change_account()
				login_account(11) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(11)
					}
				} 
				WinMove, Trove,, 944, 690, 983, 355 ;Longer than usual
				WinSetTitle, Trove,, Client11
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_eleven_been_run = 1
		}
	}
	if Email_Ten
	{
		if !(has_eleven_been_run)
		{
			if (runnum = 1)
			{
			if fishing_auto_delete = 1
				{
					Global window_auto_delete
					window_auto_delete = 1
					Global passover = 10
				}
				change_account()
				login_account(1) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(1)
					}
				} 
				WinMove, Trove,, -7, 0, 495, 355 ;1ST LINE
				WinSetTitle, Trove,, Client1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				change_account()
				login_account(2) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(2)
					}
				} 
				WinMove, Trove,, 473, 0, 495, 355
				WinSetTitle, Trove,, Client2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				change_account()
				login_account(3) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(3)
					}
				} 
				WinMove, Trove,, 953, 0, 495, 355
				WinSetTitle, Trove,, Client3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				change_account()
				login_account(4) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(4)
					}
				} 
				WinMove, Trove,, 1433, 0, 495, 355
				WinSetTitle, Trove,, Client4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				change_account()
				login_account(5) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(5)
					}
				} 
				WinMove, Trove,, -7, 345, 495, 355 ;2ND LINE
				WinSetTitle, Trove,, Client5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				change_account()
				login_account(6) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(6)
					}
				} 
				WinMove, Trove,, 473, 345, 495, 355
				WinSetTitle, Trove,, Client6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 7)
			{
				change_account()
				login_account(7) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(7)
					}
				} 
				WinMove, Trove,, 953, 345, 495, 355
				WinSetTitle, Trove,, Client7
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 8)
			{
				change_account()
				login_account(8) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(8)
					}
				} 
				WinMove, Trove,, 1433, 345, 495, 355
				WinSetTitle, Trove,, Client8
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 9)
			{
				change_account()
				login_account(9) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(9)
					}
				} 
				WinMove, Trove,, -7, 690, 970, 355 ;3RD LINE
				WinSetTitle, Trove,, Client9
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 10)
			{
				change_account()
				login_account(10) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(10)
					}
				} 
				WinMove, Trove,, 948, 690, 979, 355 ;Longer than usual
				WinSetTitle, Trove,, Client10
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_ten_been_run = 1
		}
	}
	if Email_Nine
	{
		if !(has_ten_been_run)
		{
			if (runnum = 1)
			{
			if fishing_auto_delete = 1
				{
					Global window_auto_delete := 1
					Global passover := 9
				}
				change_account()
				login_account(1) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(1)
					}
				} 
				WinMove, Trove,, -7, 0, 655, 355 ;1ST LINE
				WinSetTitle, Trove,, Client1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				change_account()
				login_account(2) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(2)
					}
				} 
				WinMove, Trove,, 633, 0, 655, 355
				WinSetTitle, Trove,, Client2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				change_account()
				login_account(3) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(3)
					}
				} 
				WinMove, Trove,, 1273, 0, 655, 355
				WinSetTitle, Trove,, Client3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				change_account()
				login_account(4) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(4)
					}
				} 
				WinMove, Trove,, -7, 347, 655, 355 ;2ND LINE
				WinSetTitle, Trove,, Client4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				change_account()
				login_account(5) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(5)
					}
				} 
				WinMove, Trove,, 633, 347, 655, 355
				WinSetTitle, Trove,, Client5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				change_account()
				login_account(6) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(6)
					}
				} 
				WinMove, Trove,, 1273, 347, 655, 355
				WinSetTitle, Trove,, Client6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 7)
			{
				change_account()
				login_account(7) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(7)
					}
				} 
				WinMove, Trove,, -7, 694, 655, 355 ;3RD LINE
				WinSetTitle, Trove,, Client7
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 8)
			{
				change_account()
				login_account(8) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(8)
					}
				} 
				WinMove, Trove,, 633, 694, 655, 355
				WinSetTitle, Trove,, Client8
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 9)
			{
				change_account()
				login_account(9) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(9)
					}
				} 
				WinMove, Trove,, 1273, 694, 655, 355
				WinSetTitle, Trove,, Client9
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_nine_been_run = 1
		}
	}
	if Email_Eight
	{
		if !(has_nine_been_run)
		{
			if (runnum = 1)
			{
			if fishing_auto_delete = 1
				{
					Global window_auto_delete := 1
					Global passover := 8
				}
				change_account()
				login_account(1) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(1)
					}
				} 
				WinMove, Trove,, -7, 0, 500, 540 ;1ST LINE
				WinSetTitle, Trove,, Client1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				change_account()
				login_account(2) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(2)
					}
				} 
				WinMove, Trove,, 478, 0, 500, 540 ;+489
				WinSetTitle, Trove,, Client2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				change_account()
				login_account(3) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(3)
					}
				} 
				WinMove, Trove,, 963, 0, 500, 540
				WinSetTitle, Trove,, Client3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				change_account()
				login_account(4) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(4)
					}
				} 
				WinMove, Trove,, 1448, 0, 500, 540
				WinSetTitle, Trove,, Client4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				change_account()
				login_account(5) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(5)
					}
				} 
				WinMove, Trove,, -7, 530, 500, 540 ;2ND LINE
				WinSetTitle, Trove,, Client5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				change_account()
				login_account(6) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(6)
					}
				} 
				WinMove, Trove,, 478, 530, 500, 540 ;+489
				WinSetTitle, Trove,, Client6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 7)
			{
				change_account()
				login_account(7) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(7)
					}
				} 
				WinMove, Trove,, 963, 530, 500, 540
				WinSetTitle, Trove,, Client7
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 8)
			{
				change_account()
				login_account(8) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(8)
					}
				} 
				WinMove, Trove,, 1448, 530, 500, 540
				WinSetTitle, Trove,, Client8
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_eight_been_run = 1
		}
	}
	if Email_Seven
	{
		if !(has_eight_been_run)
		{
			if (runnum = 1)
			{
			if fishing_auto_delete = 1
				{
					Global window_auto_delete := 1
					Global passover := 7
				}
				change_account()
				login_account(1) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(1)
					}
				} 
				WinMove, Trove,, -7, 0, 970, 355 ;1ST LINE
				WinSetTitle, Trove,, Client1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				change_account()
				login_account(2) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(2)
					}
				} 
				WinMove, Trove,, 948, 0, 979, 355 ;Longer than usual
				WinSetTitle, Trove,, Client2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				change_account()
				login_account(3) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(3)
					}
				} 
				WinMove, Trove,, -7, 345, 970, 355 ;2ND LINE
				WinSetTitle, Trove,, Client3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				change_account()
				login_account(4) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(4)
					}
				} 
				WinMove, Trove,, 948, 345, 979, 355
				WinSetTitle, Trove,, Client4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				change_account()
				login_account(5) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(5)
					}
				} 
				WinMove, Trove,, -7, 692, 655, 357 ;3RD LINE
				WinSetTitle, Trove,, Client5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				change_account()
				login_account(6) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(6)
					}
				} 
				WinMove, Trove,, 633, 692, 655, 357
				WinSetTitle, Trove,, Client6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 7)
			{
				change_account()
				login_account(7) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(7)
					}
				} 
				WinMove, Trove,, 1273, 692, 655, 357
				WinSetTitle, Trove,, Client7
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_seven_been_run = 1
		}
	}
	if Email_Six
	{
		if !(has_seven_been_run)
		{
			if fishing_auto_delete = 1
				{
					Global window_auto_delete := 1
					Global passover := 6
				}
			if fishing_auto_delete = 1
			{
			Global window_auto_delete := 1
			}
			if (runnum = 1)
			{
				change_account()
				login_account(1) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(1)
					}
				} 
				WinMove, Trove,, -7, 0, 970, 355 ;1ST LINE
				WinSetTitle, Trove,, Client1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				change_account()
				login_account(2) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(2)
					}
				} 
				WinMove, Trove,, 948, 0, 979, 355 ;Longer than usual
				WinSetTitle, Trove,, Client2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				change_account()
				login_account(3) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(3)
					}
				} 
				WinMove, Trove,, -7, 345, 970, 355 ;2ND LINE
				WinSetTitle, Trove,, Client3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				change_account()
				login_account(4) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(4)
					}
				} 
				WinMove, Trove,, 948, 345, 979, 355 ;Longer than usual
				WinSetTitle, Trove,, Client4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				change_account()
				login_account(5) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(5)
					}
				} 
				WinMove, Trove,, -7, 690, 970, 355 ;3RD LINE
				WinSetTitle, Trove,, Client5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 6)
			{
				change_account()
				login_account(6) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(6)
					}
				} 
				WinMove, Trove,, 948, 690, 979, 355 ;Longer than usual
				WinSetTitle, Trove,, Client6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_six_been_run = 1
		}
	}
	if Email_Five
	{
		if !(has_six_been_run)
		{
			if (runnum = 1)
			{
			if fishing_auto_delete = 1
				{
					Global window_auto_delete := 1
					Global passover := 5
				}
				change_account()
				login_account(1) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(1)
					}
				} 
				WinMove, Trove,, -7, 0, 970, 355 ;1ST LINE
				WinSetTitle, Trove,, Client1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				change_account()
				login_account(2) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(2)
					}
				} 
				WinMove, Trove,, 948, 0, 979, 355 ;Longer than usual
				WinSetTitle, Trove,, Client2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			
			if (runnum = 3)
			{
				change_account()
				login_account(3) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(3)
					}
				} 
				WinMove, Trove,, -7, 345, 970, 355 ;2ND LINE
				WinSetTitle, Trove,, Client3
				runnum += 1 
				Sleep, %normal_sleep%
			}
					
			if (runnum = 4)
			{
				change_account()
				login_account(4) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(4)
					}
				} 
				WinMove, Trove,, 948, 345, 979, 355 ;Longer than usual
				WinSetTitle, Trove,, Client4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 5)
			{
				change_account()
				login_account(5) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(5)
					}
				} 
				WinMove, Trove,, -7, 690, 970, 355 ;3RD LINE
				WinSetTitle, Trove,, Client5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_five_been_run = 1
		}
	}
	if Email_Four
	{
		if !(has_five_been_run)
		{
			if (runnum = 1)
			{
			if fishing_auto_delete = 1
				{
					Global window_auto_delete := 1
					Global passover := 4
				}
				change_account()
				login_account(1) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(1)
					}
				} 
				WinMove, Trove,, -7, 0, 975, 527 ;1ST LINE
				WinSetTitle, Trove,, Client1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				change_account()
				login_account(2) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(2)
					}
				} 
				WinMove, Trove,, 953, 0, 975, 527
				WinSetTitle, Trove,, Client2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 3)
			{
				change_account()
				login_account(3) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(3)
					}
				} 
				WinMove, Trove,, -7, 517, 975, 527 ;2ND LINE
				WinSetTitle, Trove,, Client3
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 4)
			{
				change_account()
				login_account(4) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(4)
					}
				} 
				WinMove, Trove,, 953, 517, 975, 527
				WinSetTitle, Trove,, Client4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_four_been_run = 1
		}
	}
	if Email_Three
	{
		if !(has_four_been_run)
		{
			if (runnum = 1)
			{
			if fishing_auto_delete = 1
				{
					Global window_auto_delete := 1
					Global passover := 3
				}
				change_account()
				login_account(1) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(1)
					}
				} 
				WinMove, Trove,, -7, 0, 975, 527 ;1ST LINE
				WinSetTitle, Trove,, Client1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				change_account()
				login_account(2) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(2)
					}
				} 
				WinMove, Trove,, 953, 0, 975, 527
				WinSetTitle, Trove,, Client2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 3)
			{
				change_account()
				login_account(3) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(3)
					}
				} 
				WinMove, Trove,, -7, 517, 1935, 527 ;2ND LINE
				WinSetTitle, Trove,, Client3
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_three_been_run = 1
		}
	}
	if Email_Two
	{
		if !(has_three_been_run)
		{
			if (runnum = 1)
			{
			if fishing_auto_delete = 1
				{
					Global window_auto_delete := 1
					Global passover := 2
				}
				change_account()
				login_account(1) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(1)
					}
				} 
				WinMove, Trove,, -7, 0, 975, 1054 ;1ST LINE
				WinSetTitle, Trove,, Client1
				runnum += 1 
				Sleep, %normal_sleep%
			}
			if (runnum = 2)
			{
				change_account()
				login_account(2) 
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					ControlClick, x430 y530, Glyph
					WinWaitActive, Trove,, %wait_for_trove_to_open%
					if ErrorLevel
					{
						login_account(2)
					}
				} 
				WinMove, Trove,, 953, 0, 975, 1054
				WinSetTitle, Trove,, Client2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_two_been_run = 1
		}
	}
	Else if Email_One
	{
		if !(has_two_been_run)
		{
		if fishing_auto_delete = 1
			{
				Global window_auto_delete := 1
				Global passover = 1
			}
			change_account()
			login_account(1) 
			WinWaitActive, Trove,, %wait_for_trove_to_open%
			if ErrorLevel
			{
				WinWaitActive, Trove,, %wait_for_trove_to_open%
				if ErrorLevel
				{
					login_account(1)
				}
			}
			WinMove, Trove,, -7, 0, 975, 1054 ;1ST LINE
			WinSetTitle, Trove,, Client1
		}
	}
}


;#####################################################################################

change_account()
{
	ControlClick, x900 y20, Glyph
	Sleep, %normal_sleep%
	ControlSend,, {down down}{down up}, Glyph
	Sleep, %normal_sleep%
	ControlClick, x900 y20, Glyph
	Sleep, %normal_sleep%
	ControlSend,, {down down}{down up}, Glyph
	Sleep, %normal_sleep%
}

login_account(num) 
{
	if num = 1
		{
		ifWinExist, Glyph Login
			{
				global glyphloginname = "Glyph Login"
			}
		ifWinExist, Glyph Anmeldung
			{
				global glyphloginname = "Glyph Anmeldung"
			}
		ifWinExist, Connexion à Glyph
			{
				global glyphloginname = "Connexion à Glyph"
			}
		ifWinExist, Вход в систему Glyph
			{
				global glyphloginname = "Вход в систему Glyph"
			}
		ifWinExist, Inicio de sesión de Glyph
			{
				global glyphloginname = "Inicio de sesión de Glyph"
			}
		ifWinExist, Login da Glyph
			{
				global glyphloginname = "Login da Glyph"
			}
		ifWinExist, Glyph 로그인
			{
				global glyphloginname = "Glyph 로그인"
			}
		ifWinExist, 登录 Glyph
			{
				global glyphloginname = "登录 Glyph"
			}
		clear_email_glyph_login()
		ControlSend,, %Email_One%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_One%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname% ; Returing to Glyph
		WinWaitNotActive, %glyphloginname%,, 2 ; Wait for menu to go away
		if ErrorLevel
		{
			login_account(1)
		}
		Sleep, 300
		ControlClick, x430 y530, Glyph  ;Click Play to login	
		}
	if num = 2
		{
		clear_email_glyph_login()
		ControlSend,, %Email_Two%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Two%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname%
		WinWaitNotActive, %glyphloginname%,, 2
		if ErrorLevel
		{
			login_account(2)
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 3
		{
		clear_email_glyph_login()
		ControlSend,, %Email_Three%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Three%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname%
		WinWaitNotActive, %glyphloginname%,, 2
		if ErrorLevel
		{
			login_account(3)
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 4
		{
		clear_email_glyph_login()
		ControlSend,, %Email_Four%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Four%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname%
		WinWaitNotActive, %glyphloginname%,, 2
		if ErrorLevel
		{
			login_account(4)
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 5
		{
		clear_email_glyph_login()
		ControlSend,, %Email_Five%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Five%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname%
		WinWaitNotActive, %glyphloginname%,, 2
		if ErrorLevel
		{
			login_account(5)
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 6
		{
		clear_email_glyph_login()
		ControlSend,, %Email_Six%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Six%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname%
		WinWaitNotActive, %glyphloginname%,, 2
		if ErrorLevel
		{
			login_account(6)
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 7
		{
		clear_email_glyph_login()
		ControlSend,, %Email_Seven%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Seven%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname%
		WinWaitNotActive, %glyphloginname%,, 2
		if ErrorLevel
		{
			login_account(7)
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 8
		{
		clear_email_glyph_login()
		ControlSend,, %Email_Eight%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Eight%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname%
		WinWaitNotActive, %glyphloginname%,, 2
		if ErrorLevel
		{
			login_account(8)
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 9
		{
		clear_email_glyph_login()
		ControlSend,, %Email_Nine%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sle4ep%
		ControlSendRaw,, %Password_Nine%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname%
		WinWaitNotActive, %glyphloginname%,, 2
		if ErrorLevel
		{
			login_account(9)
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 10
		{
		clear_email_glyph_login()
		ControlSend,, %Email_Ten%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Ten%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname%
		WinWaitNotActive, %glyphloginname%,, 2
		if ErrorLevel
		{
			login_account(10)
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 11
		{
		clear_email_glyph_login()
		ControlSend,, %Email_Eleven%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Eleven%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname%
		WinWaitNotActive, %glyphloginname%,, 2
		if ErrorLevel
		{
			login_account(11)
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
	if num = 12
		{
		clear_email_glyph_login()
		ControlSend,, %Email_Twelve%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlClick, x147 y322, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Twelve%, %glyphloginname%
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, %glyphloginname%
		WinWaitNotActive, %glyphloginname%,, 2
		if ErrorLevel
		{
			login_account(12)
		}
		Sleep, %normal_sleep% * 3
		ControlClick, x430 y530, Glyph  ;Click Play to login
		}
		Sleep, 500
}
;#####################################################################################

open_backpacks_properly_baka(choice)
{
WinActivate, Glyph
if choice = 0
{
	Sleep, 4000
	ControlSend,, {B}, Client1
	Sleep, 3000
	ControlSend,, {B}, Client2
	Sleep, 3000
	ControlSend,, {B}, Client3
	Sleep, 3000
	ControlSend,, {B}, Client4
	Sleep, 3000
	ControlSend,, {B}, Client5
	Sleep, 3000
	ControlSend,, {B}, Client6
	Sleep, 3000
	ControlSend,, {B}, Client7
	Sleep, 3000
	ControlSend,, {B}, Client8
	Sleep, 3000
	ControlSend,, {B}, Client9
	Sleep, 3000
	ControlSend,, {B}, Client10
	Sleep, 3000
	ControlSend,, {B}, Client11
	Sleep, 3000
	ControlSend,, {B}, Client12
}
if choice = 1
{
	Sleep, 4000
	ControlSend,, {B}, Client1
	Sleep, 3000
	ControlSend,, {B}, Client2
	Sleep, 3000
	ControlSend,, {B}, Client3
	Sleep, 3000
	ControlSend,, {B}, Client4
	Sleep, 3000
	ControlSend,, {B}, Client5
	Sleep, 3000
	ControlSend,, {B}, Client6
	Sleep, 3000
	ControlSend,, {B}, Client7
	Sleep, 3000
	ControlSend,, {B}, Client8
	Sleep, 3000
	ControlSend,, {B}, Client9
	Sleep, 3000
	ControlSend,, {B}, Client10
	Sleep, 3000
	ControlSend,, {B}, Client11
	Sleep, 3000
	ControlSend,, {B}, Client12
	Send, ^{Numpad1}
}
}

clear_email_glyph_login()
{
	ControlClick, x155 y253, %glyphloginname%
	Sleep, %normal_sleep%
	ControlClick, x155 y253, %glyphloginname%   
	Sleep, %normal_sleep%
	ControlClick, x155 y253, %glyphloginname%
	Sleep, %normal_sleep%
}

invdelete(numberofclients)
{
StopLoop := false
SetTimer EndLoop, %how_long_until_restart%
loop
{
if StopLoop
{
	break
}
if numberofclients = 6
{
WinActivate, Client1
Sleep, 10
MouseMove, 823, 66
Sleep, 10
MouseMove, 8, 3, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client2
Sleep, 10
MouseMove, 1787, 68
Sleep, 10
MouseMove, 8, 3, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client3
Sleep, 10
MouseMove, 821, 411
Sleep, 10
MouseMove, 8, 5, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client4
Sleep, 10
MouseMove, 1786, 410
Sleep, 10
MouseMove, 8, 4, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client5
Sleep, 10
MouseMove, 821, 756
Sleep, 10
MouseMove, 8, 3, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client6
Sleep, 10
MouseMove, 1787, 757
Sleep, 10
MouseMove, 8, 3, 50, R
Sendinput, x
Sleep, 3000
}
if numberofclients = 5
{
WinActivate, Client1
Sleep, 10
MouseMove, 824, 65
Sleep, 10
MouseMove, 9, 6, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client2
Sleep, 10
MouseMove, 1789, 64
Sleep, 10
MouseMove, 7, 6, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client3
Sleep, 10
MouseMove, 824, 410
Sleep, 10
MouseMove, 9, 7, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client4
Sleep, 10
MouseMove, 1789, 409
Sleep, 10
MouseMove, 10, 7, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client5
Sleep, 10
MouseMove, 823, 755
Sleep, 10
MouseMove, 13, 7, 50, R
Sendinput, x
Sleep, 3000
}
if numberofclients = 4
{
WinActivate, Client1
Sleep, 10
MouseMove, 746, 85
Sleep, 10
MouseMove, 12, 10, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client2
Sleep, 10
MouseMove, 1706, 90
Sleep, 10
MouseMove, 12, 7, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client3
Sleep, 10
MouseMove, 745, 602
Sleep, 10
MouseMove, 12, 7, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client4
Sleep, 10
MouseMove, 1707, 600
Sleep, 10
MouseMove, 12, 7, 50, R
Sendinput, x
Sleep, 3000
}
if numberofclients = 3
{
WinActivate, Client1
Sleep, 10
MouseMove, 747, 85
Sleep, 10
MouseMove, 13, 7, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client2
Sleep, 10
MouseMove, 1706, 90
Sleep, 10
MouseMove, 13, 7, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client3
Sleep, 10
MouseMove, 1724, 605
Sleep, 10
MouseMove, 13, 7, 50, R
Sendinput, x
Sleep, 3000
}
if numberofclients = 2
{
WinActivate, Client1
Sleep, 10
MouseMove, 716, 331
Sleep, 10
MouseMove, 15, 7, 50, R
Sendinput, x
Sleep, 3000

WinActivate, Client2
Sleep, 10
MouseMove, 1679, 330
Sleep, 10
MouseMove, 15, 7, 50, R
Sendinput, x
Sleep, 3000
}
if numberofclients = 1
{
WinActivate, Client1
Sleep, 10
MouseMove, 1585, 240
Sleep, 10
MouseMove, 10, 7, 50, R
Sendinput, x
Sleep, 3000
}

}
return
}

EndLoop:
	StopLoop := true
return

F4::ExitApp