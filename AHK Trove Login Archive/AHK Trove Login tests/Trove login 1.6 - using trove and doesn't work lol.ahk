/*
Comment section:
- Made by BLURREDDOGE / JELLYMAN123 (Can't link the other site I've posted this one with multiple versions(that are older and more buggy))
Copyright 2018, Luke Roper, All rights reserved.
- https://www.gov.uk/copyright
 
- You are free to edit this but under no circumstances, without my written permission, are you allowed to redistribute this code yourself.
*/
 
; Global vars for user optimization
Global normal_sleep 
normal_sleep := 100
 
Global delay_time_in_ms
delay_time_in_ms := 10
 
Global wait_for_login
wait_for_login := 1700
 
Global wait_for_trove_to_open
wait_for_trove_to_open := 5000
 
 
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
			Usernames := element . breakline
			if index = 1
				{
					Global Username_One
					Username_One := element
				}
			if index = 3
				{
					Global Username_Two
					Username_Two := element
				}
			 if index = 5
				{
					Global Username_Three
					Username_Three := element
				}	
			 if index = 7
				{
					Global Username_Four
					Username_Four := element
				}
			if index = 9
				{
					Global Username_Five
					Username_Five := element
				}
			if index = 11
				{
					Global Username_Six
					Username_Six := element
				}
			if index = 13
				{
					Global Username_Seven
					Username_Seven := element
				}
			if index = 15
				{
					Global Username_Eight
					Username_Eight := element
				}
			if index = 17
				{
					Global Username_Nine
					Username_Nine := element
				}
			if index = 19
				{
					Global Username_Ten
					Username_Ten := element
				}
			if index = 21
				{
					Global Username_Eleven
					Username_Eleven := element
				}
			if index = 23
				{
					Global Username_Twelve
					Username_Twelve := element
				}
	}
}
SetTitleMatchMode, 2
SetControlDelay -1
SetKeyDelay, %delay_time_in_ms%, 5 
 
 
	MsgBox,0,Usernames,
	( 
	
	            Usernames entered:
				
	 1: %Username_One%
	 2: %Username_Two%
	 3: %Username_Three%
	 4: %Username_Four%
	 5: %Username_Five%
	 6: %Username_Six%
	 7: %Username_Seven%
	 8: %Username_Eight%
	 9: %Username_Nine%
	10: %Username_Ten%
	11: %Username_Eleven%
	12: %Username_Twelve%
	), 2
MsgBox, 3,, Restart clients after 1 hour?
 
IfMsgBox Yes
{
	loop
	{
		BlockInput, On
		window_setup() ;the logging in part
		Send, ^Numpad1
		BlockInput, Off
		Sleep, 3600000 ;3600000ms =  3600s = 60m = 1h
		number_on_loop = 1
		loop
		{
			if number_on_loop > 13
			{
				break
			}
			WinKill, TroveClient%number_on_loop%
			number_on_loop += 1
		}
		
	}
}
 
IfMsgBox No
{
	BlockInput, On
	window_setup()
	Send, ^Numpad1
	BlockInput, Off
}
 
ExitApp
}
 
IfNotExist, database.txt
{
	Gui, New,, GUI
	Gui, Color, A9A9A9 ;hex for dark grey
 
	;Gui Group 1
	Gui, Add, groupbox, x10 y5 w180 h105
	Gui, Add, Text, x15 y15, Username 1:
	Gui, Add, Edit, w170 vUsername_One
	Gui, Add, Text, x15 y65, Password 1:
	Gui, Add, Edit, w170 Password vPassword_One
	
		;Gui Group 7
		Gui, Add, groupbox, x200 y5 w180 h105
		Gui, Add, Text, x205 y15, Username 7:
		Gui, Add, Edit, w170 vUsername_Seven
		Gui, Add, Text, x205 y65, Password 7:
		Gui, Add, Edit, w170 Password vPassword_Seven
 
	;Gui Group 2
	Gui,add, groupbox, x10 y110 w180 h105
	Gui, Add, Text, x15 y120, Username 2:
	Gui, Add, Edit, w170 vUsername_Two
	Gui, Add, Text, x15 y170, Password 2:
	Gui, Add, Edit, w170 Password vPassword_Two
 
		;Gui Group 8
		Gui, Add, groupbox, x200 y110 w180 h105
		Gui, Add, Text, x205 y120, Username 8:
		Gui, Add, Edit, w170 vUsername_Eight
		Gui, Add, Text, x205 y170, Password 8:
		Gui, Add, Edit, w170 Password vPassword_Eight
 
	;Gui Group 3
	Gui,add, groupbox, x10 y215 w180 h105
	Gui, Add, Text, x15 y225, Username 3:
	Gui, Add, Edit, w170 vUsername_Three
	Gui, Add, Text, x15 y275, Password 3:
	Gui, Add, Edit, w170 Password vPassword_Three
 
		;Gui Group 9
		Gui, Add, groupbox, x200 y215 w180 h105
		Gui, Add, Text, x205 y225, Username 9:
		Gui, Add, Edit, w170 vUsername_Nine
		Gui, Add, Text, x205 y275, Password 9:
		Gui, Add, Edit, w170 Password vPassword_Nine
 
	;Gui Group 4
	Gui,add, groupbox, x10 y320 w180 h105
	Gui, Add, Text, x15 y330, Username 4:
	Gui, Add, Edit, w170 vUsername_Four
	Gui, Add, Text, x15 y380, Password 4:
	Gui, Add, Edit, w170 Password vPassword_Four
 
		;Gui Group 10
		Gui, Add, groupbox, x200 y320 w180 h105
		Gui, Add, Text, x205 y330, Username 10:
		Gui, Add, Edit, w170 vUsername_Ten
		Gui, Add, Text, x205 y380, Password 10:
		Gui, Add, Edit, w170 Password vPassword_Ten
		
	;Gui Group 5
	Gui,add, groupbox, x10 y425 w180 h105
	Gui, Add, Text, x15 y435, Username 5:
	Gui, Add, Edit, w170 vUsername_Five
	Gui, Add, Text, x15 y485, Password 5:
	Gui, Add, Edit, w170 Password vPassword_Five
	
		;Gui Group 11
		Gui, Add, groupbox, x200 y425 w180 h105
		Gui, Add, Text, x205 y435, Username 11:
		Gui, Add, Edit, w170 vUsername_Eleven
		Gui, Add, Text, x205 y485, Password 11:
		Gui, Add, Edit, w170 Password vPassword_Eleven
		
	;Gui Group 6
	Gui,add, groupbox, x10 y530 w180 h105
	Gui, Add, Text, x15 y540, Username 6:
	Gui, Add, Edit, w170 vUsername_Six
	Gui, Add, Text, x15 y590, Password 6:
	Gui, Add, Edit, w170 Password vPassword_Six
	
		;Gui Group 12
		Gui, Add, groupbox, x200 y530 w180 h135
		Gui, Add, Text, x205 y540, Username 12:
		Gui, Add, Edit, w170 vUsername_Twelve
		Gui, Add, Text, x205 y590, Password 12:
		Gui, Add, Edit, w170 Password vPassword_Twelve
		Gui, Add, Button, Default gOK, Save Usernames/Passwords to use
		Gui, Show, w395 h675
	return
 
	OK:
	Gui, Submit
	Gui, Destroy
	MsgBox,
	( 
	First Username: %Username_One%
	First Password: %Password_One% 
 
	Second Username: %Username_Two%
	Second Password: %Password_Two%
 
	Third Username: %Username_Three%
	Third Password: %Password_Three%
 
	Fourth Username: %Username_Four%
	Fourth Password: %Password_Four%
	
	Fith Username: %Username_Five%
	Fith Password: %Password_Five%
	
	Sixth Username: %Username_Six%
	Sixth Password: %Password_Six%
	
	Seventh Username: %Username_Seven%
	Seventh Password: %Password_Seven%
	
	Eighth Username: %Username_Eight%
	Eigth Password: %Password_Eight%
	
	Ninth Username: %Username_Nine%
	Ninth Password: %Password_Nine%
	
	Tenth Username: %Username_Ten%
	Tenth Password: %Password_Ten%
	
	Eleventh Username: %Username_Eleven%
	Eleventh Password: %Password_Eleven%
	
	Twelth Username: %Username_Twelve%
	Twelth Password: %Password_Twelve%
	)
	;Writes Usernames+ps to file
 
	;#################################################  ####################
	;                    Writing variables to file
	;#################################################  ####################
	If (!Username_One)
		ExitApp
	FileAppend, %Username_One%`n, database.txt
	FileAppend, %Password_One%`n, database.txt
	If (!Username_Two)
		ExitApp
	FileAppend, %Username_Two%`n, database.txt
	FileAppend, %Password_Two%`n, database.txt
	If (!Username_Three)
		ExitApp
	FileAppend, %Username_Three%`n, database.txt
	FileAppend, %Password_Three%`n, database.txt
	If (!Username_Four)
		ExitApp
	FileAppend, %Username_Four%`n, database.txt
	FileAppend, %Password_Four%`n, database.txt
	If (!Username_Four)
		ExitApp
	FileAppend, %Username_Five%`n, database.txt
	FileAppend, %Password_Five%`n, database.txt
	If (!Username_Six)
		ExitApp
	FileAppend, %Username_Six%`n, database.txt
	FileAppend, %Password_Six%`n, database.txt
	If (!Username_Seven)
		ExitApp
	FileAppend, %Username_Seven%`n, database.txt
	FileAppend, %Password_Seven%`n, database.txt
	If (!Username_Eight)
		ExitApp
	FileAppend, %Username_Eight%`n, database.txt
	FileAppend, %Password_Eight%`n, database.txt
	If (!Username_Nine)
		ExitApp
	FileAppend, %Username_Nine%`n, database.txt
	FileAppend, %Password_Nine%`n, database.txt
	If (!Username_Ten)
		ExitApp
	FileAppend, %Username_Ten%`n, database.txt
	FileAppend, %Password_Ten%`n, database.txt
	If (!Username_Eleven)
		ExitApp
	FileAppend, %Username_Eleven%`n, database.txt
	FileAppend, %Password_Eleven%`n, database.txt
	If (!Username_Twelve)
		ExitApp
	FileAppend, %Username_Twelve%`n, database.txt
	FileAppend, %Password_Twelve%`n, database.txt
 
	ExitApp
}
 
 
window_setup()
{
	runnum = 1
	if Username_Twelve
	{
		if (runnum = 1)
		{
			open_login()
			login_account(1)
			WinWaitActive, Trove
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
			WinWaitActive, Trove
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
			WinWaitActive, Trove
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
			WinWaitActive, Trove
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
			WinWaitActive, Trove
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
			WinWaitActive, Trove
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
			WinWaitActive, Trove 
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
			WinWaitActive, Trove
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
			WinWaitActive, Trove
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
			WinWaitActive, Trove
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
			WinWaitActive, Trove
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
			WinWaitActive, Trove
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, 1443, 690, 485, 355
			WinSetTitle, %wintitle%,, TroveClient12
			runnum += 1 
			Sleep, %normal_sleep%
		}
		has_twelve_been_run = 1
	}
	if Username_Eleven
	{
		if (!has_twelve_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 944, 690, 983, 355 ;Longer than usual
				WinSetTitle, %wintitle%,, TroveClient11
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_eleven_been_run = 1
		}
	}
	if Username_Ten
	{
		if (!has_eleven_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 948, 690, 979, 355 ;Longer than usual
				WinSetTitle, %wintitle%,, TroveClient10
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_ten_been_run = 1
		}
	}
	if Username_Nine
	{
		if (!has_ten_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1273, 694, 655, 355
				WinSetTitle, %wintitle%,, TroveClient9
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_nine_been_run = 1
		}
	}
	if Username_Eight
	{
		if (!has_nine_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1448, 530, 500, 540
				WinSetTitle, %wintitle%,, TroveClient8
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_eight_been_run = 1
		}
	}
	if Username_Seven
	{
		if (!has_eight_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 1273, 692, 655, 357
				WinSetTitle, %wintitle%,, TroveClient7
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_seven_been_run = 1
		}
	}
	if Username_Six
	{
		if (!has_seven_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 948, 690, 979, 355 ;Longer than usual
				WinSetTitle, %wintitle%,, TroveClient6
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_six_been_run = 1
		}
	}
	if Username_Five
	{
		if (!has_six_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 690, 970, 355 ;3RD LINE
				WinSetTitle, %wintitle%,, TroveClient5
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_five_been_run = 1
		}
	}
	if Username_Four
	{
		if (!has_five_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 953, 517, 975, 527
				WinSetTitle, %wintitle%,, TroveClient4
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_four_been_run = 1
		}
	}
	if Username_Three
	{
		if (!has_four_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, -7, 517, 1935, 527 ;2ND LINE
				WinSetTitle, %wintitle%,, TroveClient3
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_three_been_run = 1
		}
	}
	if Username_Two
	{
		if (!has_three_been_run)
		{
			if (runnum = 1)
			{
				open_login()
				login_account(1) 
				WinWaitActive, Trove 
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
				WinWaitActive, Trove 
				WinGetActiveTitle, windowTitle
				WinMove, %windowTitle%,, 953, 0, 975, 1054
				WinSetTitle, %wintitle%,, TroveClient2
				runnum += 1 
				Sleep, %normal_sleep%
			}
			has_two_been_run = 1
		}
	}
	if Username_One
	{
		if (!has_two_been_run)
		{
			open_login()
			MsgBox, got past open_login
			login_account(1) 
			WinWaitActive, Trove 
			WinGetActiveTitle, windowTitle
			WinMove, %windowTitle%,, -7, 0, 975, 1054 ;1ST LINE
			WinSetTitle, %wintitle%,, TroveClient1
		}
	}
}
 
 
;#######################################################################################
 
open_login()
{
	Run, Trove.exe, C:\Program Files (x86)\Steam\steamapps\common\Trove\Games\Trove\Live
	Sleep, 4000
}
 
 
 
login_account(num) 
{
	if num = 1
		{
		WinSetTitle, Trove,, tempid
		Sleep, %normal_sleep%
		MsgBox, Changed id
		ControlSendRaw,, %Username_One%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_One%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, tempid
		}
	if num = 2
		{
		ControlSendRaw,, %Username_Two%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Two%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, Trove
		}
	if num = 3
		{
		ControlSendRaw,, %Username_Three%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Three%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, tempid
		}
	if num = 4
		{
		ControlSendRaw,, %Username_Four%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Four%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, tempid
		}
	if num = 5
		{
		ControlSendRaw,, %Username_Five%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Five%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, tempid
		}
	if num = 6
		{
		ControlSendRaw,, %Username_Six%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Six%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, tempid
		}
	if num = 7
		{
		ControlSendRaw,, %Username_Seven%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Seven%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, tempid
		}
	if num = 8
		{
		ControlSendRaw,, %Username_Eight%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Eight%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, tempid
		}
	if num = 9
		{
		ControlSendRaw,, %Username_Nine%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Nine%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, tempid
		}
	if num = 10
		{
		ControlSendRaw,, %Username_Ten%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Ten%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, tempid
		}
	if num = 11
		{
		ControlSendRaw,, %Username_Eleven%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Eleven%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, tempid	
		}
	if num = 12
		{
		ControlSendRaw,, %Username_Twelve%, tempid
		Sleep, %normal_sleep%
			ControlGetPos, x, y, width, height, %cr%, A 
			MouseMove, % x + Width / 2, % y + Height / 2 + 5, 0
			Click
		Sleep, %normal_sleep%
		ControlSendRaw,, %Password_Twelve%, tempid
		Sleep, %normal_sleep%
		ControlSend,, {enter down}{enter up}, tempid
		}
		Sleep, 500
}
;#################################################  ####################################
 
Esc::ExitApp
