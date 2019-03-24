#NoEnv
#SingleInstance, Force
OnExit(ObjBindMethod(exitclass,"DoBeforeExit"))
SendMode Input	; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, 2
SetControlDelay -1

/*
	"//(!)<name>" are bookmarks (from a VS Code extension):
	https://marketplace.visualstudio.com/items?itemName=ExodiusStudios.comment-anchors

   Copyright 2019 Luke Roper

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

	   http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.

*/

;//SECTION Global Vars
global normal_sleep 			 := 300
global wait_for_trove_to_open	 := 5
global how_long_until_restart	 := 3600000
global wait_for_glyph_to_login	 := 2200
login			:= []
trove_directory := "C:\Program Files (x86)\Steam\steamapps\common\Trove"
;//!SECTION Global Vars

SetKeyDelay, 20, 5

;//SECTION Fetch login details
if FileExist("database.txt") ;//ANCHOR Email reading
{
	Loop, Read, database.txt
	{
		login.Push(A_LoopReadLine)
	}

	;generate list to display emails on GUI
	counter = 0
	for x, item in login
	{
		if (Mod(x, 2) = 1)
		{
			string_of_emails .= (x - counter) . " - " . item . "`n"
			counter += 1
		}
	}

	try
	{
		RunWait, GlyphClientApp.exe, %trove_directory%, 5
	}
	catch
	{
		Run, Autohotkey.exe, Error_Display.ahk, 1
	}

	;//ANCHOR Launch GUI
	Gui, +AlwaysOnTop
	Gui, Add, Tab, x-6 y-2 w250 h225, Launch Options|Info|Emails

	Gui, Tab, Launch Options
	howlonguntilrestartseconds := Round(how_long_until_restart /= 60000, 2)
	Gui, Add, CheckBox, x32 y29 w150 h30 vOpenBackpack, F3 To Open backpack on all clients, when in-game
	Gui, Add, CheckBox, x32 y58 w150 h30 vLaunchFishingBot, Start Nippy's fishing bot upon launch
	Gui, Add, CheckBox, x32 y90 w150 h30 vRestartEveryDelay, Restart clients every %howlonguntilrestartseconds% minutes
	Gui, Add, CheckBox, x32 y118 w150 h30 vlaunch_with_gui, Launch with Option_Gui
	Gui, Add, Button, x22 y155 w200 h40 glaunchthemainscript, Launch

	Gui, Tab, Info
	Gui, Add, Text, x12 y29 w220 h70, Made by BLURREDDOGE / JELLYMAN123`nCopyright 2018`, Luke Roper`, All rights reserved. - https://www.gov.uk/copyright
	Gui, Add, Text, x12 y99 w220 h42 +border, - You are free to edit this but under no circumstances`, without my written permission`, are you allowed to redistribute this code yourself.

	Gui, Tab, Emails
	Gui, Add, Button, x22 y25 w200 h190 gshowemails, Show Emails
	Gui, Show, x100 y225 h220 w240, Launcher
	return	;pause at GUI for the user to continue with buttons

	;//ANCHOR Display all emails
	showemails:
	{
		MsgBox,0,Emails, Emails entered: `n%string_of_emails%
	}
	return

	;//ANCHOR Submit+Destroy GUI
	launchthemainscript:
	{
		Gui, Submit
		Gui, Destroy
	}


	if (launch_with_gui = 1)
	{
		Run, AutoHotkey.exe Option_Gui.ahk %OpenBackpack% %LaunchFishingBot% %RestartEveryDelay%
	}
	;//SECTION Runmodes
	;//ANCHOR Restart every x
	if (RestartEveryDelay = 1)
	{
		loop
		{
			window_setup(1, 0, login)
			if (LaunchFishingBot)
			{
				Send, ^{Numpad1}  ;Nippy's fishing bot: start all
			}
			if (OpenBackpack)
			{
				Run, AutoHotKey.exe Open_Backpack.ahk
			}

			Sleep, %how_long_until_restart%

			loop, 30
			{
				WinKill, Client%A_Index%
			}
		}
	}
	;//ANCHOR One-run
	else
	{
		window_setup(1, 0, login)
		Sleep, %normal_sleep%
		if (LaunchFishingBot)
		{
			Send, ^{Numpad1}
		}
		if (OpenBackpack)
		{
			Run, AutoHotKey.exe, Open_Backpack.ahk
		}
		ExitApp
	}
	;//!SECTION Runmodes
}
;//!SECTION Fetch login details
;//SECTION Create login details
IfNotExist, database.txt  ;//ANCHOR Account adding
{
	MsgBox, You do not need to fill in all the boxes`, only the ones you want.
	Gui, New,, Create Email & Password Database
	Gui, Color, A9A9A9

	;//SECTION Gui-Groups
	;//ANCHOR Gui Group 1
	Gui, Add, groupbox, x10 y5 w180 h105
	Gui, Add, Text, x15 y15, Email 1:
	Gui, Add, Edit, w170 vEmail_One
	Gui, Add, Text, x15 y65, Password 1:
	Gui, Add, Edit, w170 Password vPassword_One
		;//ANCHOR Gui Group 7
		Gui, Add, groupbox, x200 y5 w180 h105
		Gui, Add, Text, x205 y15, Email 7:
		Gui, Add, Edit, w170 vEmail_Seven
		Gui, Add, Text, x205 y65, Password 7:
		Gui, Add, Edit, w170 Password vPassword_Seven
			;//ANCHOR Gui Group 13
			Gui, Add, groupbox, x390 y5 w180 h105
			Gui, Add, Text, x395 y15, Email 13:
			Gui, Add, Edit, w170 vEmail_Thirteen
			Gui, Add, Text, x395 y65, Password 13:
			Gui, Add, Edit, w170 Password vPassword_Thirteen
				;//ANCHOR Gui Group 19
				Gui, Add, groupbox, x580 y5 w180 h105
				Gui, Add, Text, x585 y15, Email 19:
				Gui, Add, Edit, w170 vEmail_Nineteen
				Gui, Add, Text, x585 y65, Password 19:
				Gui, Add, Edit, w170 Password vPassword_Nineteen
					;//ANCHOR Gui Group 25
					Gui, Add, groupbox, x770 y5 w180 h105
					Gui, Add, Text, x775 y15, Email 25:
					Gui, Add, Edit, w170 vEmail_TwentyFive
					Gui, Add, Text, x775 y65, Password 25:
					Gui, Add, Edit, w170 Password vPassword_TwentyFive
	;//ANCHOR Gui Group 2
	Gui, Add, groupbox, x10 y110 w180 h105
	Gui, Add, Text, x15 y120, Email 2:
	Gui, Add, Edit, w170 vEmail_Two
	Gui, Add, Text, x15 y170, Password 2:
	Gui, Add, Edit, w170 Password vPassword_Two
		;//ANCHOR Gui Group 8
		Gui, Add, groupbox, x200 y110 w180 h105
		Gui, Add, Text, x205 y120, Email 8:
		Gui, Add, Edit, w170 vEmail_Eight
		Gui, Add, Text, x205 y170, Password 8:
		Gui, Add, Edit, w170 Password vPassword_Eight
			;//ANCHOR Gui Group 14
			Gui, Add, groupbox, x390 y110 w180 h105
			Gui, Add, Text, x395 y120, Email 14:
			Gui, Add, Edit, w170 vEmail_Fourteen
			Gui, Add, Text, x395 y170, Password 14:
			Gui, Add, Edit, w170 Password vPassword_Fourteen
				;//ANCHOR Gui Group 20
				Gui, Add, groupbox, x580 y110 w180 h105
				Gui, Add, Text, x585 y120, Email 20:
				Gui, Add, Edit, w170 vEmail_Twenty
				Gui, Add, Text, x585 y170, Password 20:
				Gui, Add, Edit, w170 Password vPassword_Twenty
					;//ANCHOR Gui Group 26
					Gui, Add, groupbox, x770 y110 w180 h105
					Gui, Add, Text, x775 y120, Email 26:
					Gui, Add, Edit, w170 vEmail_TwentySix
					Gui, Add, Text, x775 y170, Password 26:
					Gui, Add, Edit, w170 Password vPassword_TwentySix
	;//ANCHOR Gui Group 3
	Gui, Add, groupbox, x10 y215 w180 h105
	Gui, Add, Text, x15 y225, Email 3:
	Gui, Add, Edit, w170 vEmail_Three
	Gui, Add, Text, x15 y275, Password 3:
	Gui, Add, Edit, w170 Password vPassword_Three
		;//ANCHOR Gui Group 9
		Gui, Add, groupbox, x200 y215 w180 h105
		Gui, Add, Text, x205 y225, Email 9:
		Gui, Add, Edit, w170 vEmail_Nine
		Gui, Add, Text, x205 y275, Password 9:
		Gui, Add, Edit, w170 Password vPassword_Nine
			;//ANCHOR Gui Group 15
			Gui, Add, groupbox, x390 y215 w180 h105
			Gui, Add, Text, x395 y225, Email 15:
			Gui, Add, Edit, w170 vEmail_Fifthteen
			Gui, Add, Text, x395 y275, Password 15:
			Gui, Add, Edit, w170 Password vPassword_Fiftheen
				;//ANCHOR Gui Group 21
				Gui, Add, groupbox, x580 y215 w180 h105
				Gui, Add, Text, x585 y225, Email 21:
				Gui, Add, Edit, w170 vEmail_TwentyOne
				Gui, Add, Text, x585 y275, Password 21:
				Gui, Add, Edit, w170 Password vPassword_TwentyOne
					;//ANCHOR Gui Group 27
					Gui, Add, groupbox, x770 y215 w180 h105
					Gui, Add, Text, x775 y225, Email 27:
					Gui, Add, Edit, w170 vEmail_TwentySeven
					Gui, Add, Text, x775 y275, Password 27:
					Gui, Add, Edit, w170 Password vPassword_TwentySeven
	;//ANCHOR Gui Group 4
	Gui, Add, groupbox, x10 y320 w180 h105
	Gui, Add, Text, x15 y330, Email 4:
	Gui, Add, Edit, w170 vEmail_Four
	Gui, Add, Text, x15 y380, Password 4:
	Gui, Add, Edit, w170 Password vPassword_Four
		;//ANCHOR Gui Group 10
		Gui, Add, groupbox, x200 y320 w180 h105
		Gui, Add, Text, x205 y330, Email 10:
		Gui, Add, Edit, w170 vEmail_Ten
		Gui, Add, Text, x205 y380, Password 10:
		Gui, Add, Edit, w170 Password vPassword_Ten
			;//ANCHOR Gui Group 16
			Gui, Add, groupbox, x390 y320 w180 h105
			Gui, Add, Text, x395 y330, Email 16:
			Gui, Add, Edit, w170 vEmail_Sixteen
			Gui, Add, Text, x395 y380, Password 16:
			Gui, Add, Edit, w170 Password vPassword_Sixteen
				;//ANCHOR Gui Group 22
				Gui, Add, groupbox, x580 y320 w180 h105
				Gui, Add, Text, x585 y330, Email 22:
				Gui, Add, Edit, w170 vEmail_TwentyTwo
				Gui, Add, Text, x585 y380, Password 22:
				Gui, Add, Edit, w170 Password vPassword_TwentyTwo
					;//ANCHOR Gui Group 28
					Gui, Add, groupbox, x770 y320 w180 h105
					Gui, Add, Text, x775 y330, Email 28:
					Gui, Add, Edit, w170 vEmail_TwentyEight
					Gui, Add, Text, x775 y380, Password 28:
					Gui, Add, Edit, w170 Password vPassword_TwentyEight
	;//ANCHOR Gui Group 5
	Gui, Add, groupbox, x10 y425 w180 h105
	Gui, Add, Text, x15 y435, Email 5:
	Gui, Add, Edit, w170 vEmail_Five
	Gui, Add, Text, x15 y485, Password 5:
	Gui, Add, Edit, w170 Password vPassword_Five
		;//ANCHOR Gui Group 11
		Gui, Add, groupbox, x200 y425 w180 h105
		Gui, Add, Text, x205 y435, Email 11:
		Gui, Add, Edit, w170 vEmail_Eleven
		Gui, Add, Text, x205 y485, Password 11:
		Gui, Add, Edit, w170 Password vPassword_Eleven
			;//ANCHOR Gui Group 17
			Gui, Add, groupbox, x390 y425 w180 h105
			Gui, Add, Text, x395 y435, Email 17:
			Gui, Add, Edit, w170 vEmail_Seventeen
			Gui, Add, Text, x395 y485, Password 17:
			Gui, Add, Edit, w170 Password vPassword_Seventeen
				;//ANCHOR Gui Group 23
				Gui, Add, groupbox, x580 y425 w180 h105
				Gui, Add, Text, x585 y435, Email 23:
				Gui, Add, Edit, w170 vEmail_TwentyThree
				Gui, Add, Text, x585 y485, Password 23:
				Gui, Add, Edit, w170 Password vPassword_TwentyThree
					;//ANCHOR Gui Group 29
					Gui, Add, groupbox, x770 y425 w180 h105
					Gui, Add, Text, x775 y435, Email 29:
					Gui, Add, Edit, w170 vEmail_TwentyNine
					Gui, Add, Text, x775 y485, Password 29:
					Gui, Add, Edit, w170 Password vPassword_TwentyNine
	;//ANCHOR Gui Group 6
	Gui, Add, groupbox, x10 y530 w180 h105
	Gui, Add, Text, x15 y540, Email 6:
	Gui, Add, Edit, w170 vEmail_Six
	Gui, Add, Text, x15 y590, Password 6:
	Gui, Add, Edit, w170 Password vPassword_Six
		;//ANCHOR Gui Group 12
		Gui, Add, groupbox, x200 y530 w180 h105
		Gui, Add, Text, x205 y540, Email 12:
		Gui, Add, Edit, w170 vEmail_Twelve
		Gui, Add, Text, x205 y590, Password 12:
		Gui, Add, Edit, w170 Password vPassword_Twelve
			;//ANCHOR Gui Group 18
			Gui, Add, groupbox, x390 y530 w180 h105
			Gui, Add, Text, x395 y540, Email 18:
			Gui, Add, Edit, w170 vEmail_Eighteen
			Gui, Add, Text, x395 y590, Password 18:
			Gui, Add, Edit, w170 Password vPassword_Eighteen
				;//ANCHOR Gui Group 24
				Gui, Add, groupbox, x580 y530 w180 h105
				Gui, Add, Text, x585 y540, Email 24:
				Gui, Add, Edit, w170 vEmail_TwentyFour
				Gui, Add, Text, x585 y590, Password 24:
				Gui, Add, Edit, w170 Password vPassword_TwentyFour
					;//ANCHOR Gui Group 30
					Gui, Add, groupbox, x770 y530 w180 h105
					Gui, Add, Text, x775 y540, Email 30:
					Gui, Add, Edit, w170 vEmail_Thirty
					Gui, Add, Text, x775 y590, Password 30:
					Gui, Add, Edit, w170 Password vPassword_Thirty
	;//!SECTION Gui-Groups
	Gui, Add, Button, x10 y640 w940 gwrite_to_file, Continue
	Gui, Show, w965 h675
	return

	;//ANCHOR Write details to file
	write_to_file:
	{
		numbers := ["One", "Two", "Three", "Four", "Five","Six","Seven","Eight","Nine","Ten","Eleven","Twelve","Thirteen","Fourteen","Fifthteen","Sixteen","Seventeen","Eighteen","Nineteen","Twenty","TwentyOne","TwentyTwo","TwentyThree","TwentyFour","TwentyFive","TwentySix","TwentySeven","TwentyEight","TwentyNine","Thirty"]

		Gui, Submit
		Gui, Destroy

		loop % (numbers.MaxIndex())
		{
			num := numbers[A_Index]
			FileAppend % Email_%num% . "`n" . Password_%num% . "`n", database.txt
		}
		reload	;We now have the accounts, lets get back to the program
	}
	return
}
;//!SECTION Create login details
;//SECTION Login functions
window_setup(runnum, only_once, login)	;//ANCHOR Window_setup
{
	Check_internet_connection()

	tc1  := [-7,0,975,1054]
	tc2  := [-7,0,975,1054,953,0,975,1054]
	tc3  := [-7,0,975,527,953,0,975,527,-7,517,1935,527]
	tc4  := [-7,0,975,527,953,0,975,527,-7,517,975,527,953,517,975,527]
	tc5  := [-7,0,970,355,948,0,979,355,-7,345,970,355,948,345,979,355,-7,690,970,355]
	tc6  := [-7,0,970,355,948,0,979,355,-7,345,970,355,948,345,979,355,-7,690,970,355,948,690,979,355]
	tc7  := [-7,0,970,355,948,0,979,355,-7,345,970,355,948,345,979,355,-7,692,655,357,633,692,655,357,1273,692,655,357]
	tc8  := [-7,0,500,540,478,0,500,540,963,0,500,540,1448,0,500,540,-7,530,500,540,478,530,500,540,963,530,500,540,1448,530,500,540]
	tc9  := [-7,0,655,355,633,0,655,355,1273,0,655,355,-7,347,655,355,633,347,655,355,1273,347,655,355,-7,694,655,355,633,694,655,355,1273,694,655,355]
	tc10 := [-7,0,495,355,473,0,495,355,953,0,495,355,1433,0,495,355,-7,345,495,355,473,345,495,355,953,345,495,355,1433,345,495,355,-7,690,970,355,948,690,979,355]
	tc11 := [-7,0,495,355,473,0,495,355,953,0,495,355,1433,0,495,355,-7,345,495,355,473,345,495,355,953,345,495,355,1433,345,495,355,-7,690,495,355,473,690,485,355,944,690,983,355]
	tc12 := [-7,0,495,355,473,0,495,355,953,0,495,355,1433,0,495,355,-7,345,495,355,473,345,495,355,953,345,495,355,1433,345,495,355,-7,690,495,355,473,690,485,355,953,690,485,355,1443,690,485,355]

	accountnum := login.MaxIndex()
	tcnum := Round(accountnum / 2, 0)

	if (only_once = 1)
	{
		if (runnum > 1)
		{
			passnum := runnum * 2
		}
		Run_login_functions(login[passnum], login[(passnum + 1)])
		Sleep, %normal_sleep%
		WinMove, Trove,, %x%, %y%, %w%, %h%
		Sleep, %normal_sleep%
		WinSetTitle, Trove,, Client%runnum%
		Sleep, %normal_sleep%
	}
	else
	{
		counter := 1
		offset := 1
		Loop, %accountnum%
		{
			if (Mod(A_Index, 2) = 1)
			{
				Run_login_functions(login[A_Index], login[A_Index+1])
				Sleep, %normal_sleep%

				if (counter != 1)
				{
					offset += 4
				}

				x := tc%tcnum%[offset]
				y := tc%tcnum%[offset + 1]
				w := tc%tcnum%[offset + 2]
				h := tc%tcnum%[offset + 3]

				WinMove, Trove,, %x%, %y%, %w%, %h%
				Sleep, %normal_sleep%
				WinSetTitle, Trove,, Client%counter%
				Sleep, %normal_sleep%
				counter += 1
			}
		}
	}
	Check_for_crashed_clients(accoutnum, login)
}

;//ANCHOR Run login functions
Run_login_functions(email, pass)
{
	change_account()
	set_glyph_login_name()
	compact_login_account(email, pass)
}

;//ANCHOR Set-up for login
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

;//ANCHOR Find Glyph Login windowtitle
set_glyph_login_name()
{
	glyphlogintitles := ["Glyph Login","Glyph Anmeldung","Connexion à Glyph","Вход в систему Glyph","Inicio de sesión de Glyph","Login da Glyph","Glyph 로그인","登录 Glyph"]
	loop  ;Keep checking until window is found
	{
		for x, item in glyphlogintitles
		{
			if (WinExist(glyphlogintitles[x]))
			{
				global glyphloginname := glyphlogintitles[x]
				break 2
			}
		}
		Sleep, 1000
	}
}

;//ANCHOR Log account into Glyph
compact_login_account(email, pass)
{
	;//NOTE Clears login information
	loop 3
	{
		ControlClick, x155 y253, %glyphloginname%
		Sleep, %normal_sleep%
	}
	Send_from_clipboard(email)
	ControlClick, x147 y322, %glyphloginname%
	Sleep, %normal_sleep%
	Send_from_clipboard(pass)
	ControlSend,, {enter down}{enter up}, %glyphloginname%

	WinWaitNotActive, %glyphloginname%,, 2  ;login complete

	if (ErrorLevel)
	{
		compact_login_account(email, pass)
	}

	ControlClick, x430 y530, Glyph
	Sleep, %wait_for_trove_to_open%

	loop
	{
		Sleep, %normal_sleep%
		if !(WinExist("Trove"))
		{
			ControlClick, x430 y530, Glyph
			Sleep, 1000
		}
		else
		{
			break
		}
	}
	Sleep, %normal_sleep%
}

;//ANCHOR Check for crashed clients
Check_for_crashed_clients(emailnum, login)
{
	loop %emailnum%
	{
		client_name := "Client" . A_Index
		if !WinExist(client_name)
		{
			window_setup(A_Index, 1, login)
		}
	}
}

;//ANCHOR Check for internet connectivity to stop failed logins continuing to fail
Check_internet_connection()
{
	if (DllCall("Wininet.dll\InternetGetConnectedState", "Str", 0x40,"Int",0)) = 0
	{
		loop
		{
			if (DllCall("Wininet.dll\InternetGetConnectedState", "Str", 0x40,"Int",0)) = 0
			{
				Run, Autohotkey.exe Error_Display.ahk 2
				;//NOTE Sub-loop to wait for reconnection to internet
				loop
				{
					if (DllCall("Wininet.dll\InternetGetConnectedState", "Str", 0x40,"Int",0)) = 1
					{
						break
					}

					Sleep, %normal_sleep%

					if !WinExist("Error_Display.ahk")
					{
						Run, Autohotkey.exe Error_Display.ahk 3
						Sleep, 1000
					}
				}
			}
			else
			{
				DetectHiddenWindows, On ;So that we can find Error_Display.ahk in the tray
				WinClose, Error_Display.ahk ahk_class AutoHotkey
				DetectHiddenWindows, Off ;If DetectHiddenWindows is left on, it breaks the rest of the script due to multiple similar hidden window names in use
				break
			}
			Sleep, 1000
		}
	}
}

;//ANCHOR Send login details with clipboard
Send_from_clipboard(stuff_to_save)
{
	clipboard =  %stuff_to_save%
	ControlSend,, ^v, %glyphloginname%,
	clipboard = ` ;clear clipboard
}

;//ANCHOR Check for dashboard on trove launch
Check_for_pop_up_on_lauch(x)
{
	WinGetPos, , , w, h, Client%x%
	w_one := w//1.9
	w_two := w//18
	h_one := h//8.3
	h_two := h//19
	x     := w_one - w_two
	y     := h_one + h_two
	PixelGetColor, col, %x%, %y%, RGB
	;if col1 = "0x"
	return col
}
;//!SECTION Login Functions

;//SECTION Exit script
;//ANCHOR DoBeforeExit
class exitclass
{
	DoBeforeExit()
	{
		Send, {Shift}  ;Incase a shift-down-up was interrupted
		Send, {CTRL}   ;Incase a ctrl-down-up was interrupted
	}
}

;//ANCHOR Exit Script
$*F4::ExitApp
;//!SECTION Exit script

/* //NOTE Notices
╔════════════════════════════════════════════════════════════════════════════════╗
║╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳╳║
╠════════════════════════════════════════════════════════════════════════════════╣
║    Discord: Lukegotjellyfish#0473                                              ║
║    GitHub rep: https://github.com/lukegotjellyfish/Trove-Login-Gitrelease      ║
║    Copyright (C) 2019  Luke Roper                                              ║
╚════════════════════════════════════════════════════════════════════════════════╝
*/