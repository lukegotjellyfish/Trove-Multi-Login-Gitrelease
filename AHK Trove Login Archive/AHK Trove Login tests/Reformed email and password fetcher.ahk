;Global delay timers for easy management
global normal_sleep                    := 200
global wait_for_trove_to_open          := 5
global delay_time_in_ms                := 20
global how_long_until_restart          := 3600000
global troveopenerrorcheck             := 600
global wait_for_glyph_to_login         := 1800


if FileExist("database.txt")
{
	Emails := []
	Passwords := []
	Array_Count = 0
	Loop, Read, database.txt
	{
		if Mod(Array_Count, 2) = 0
		{
			Emails.Push(A_LoopReadLine)
		}
		else
		{
			Passwords.Push(A_LoopReadLine)
		}
		Array_Count += 1
	}
	Account_Num := Array_Count/2
    ;generate list to display emails on GUI
    for x, item in Emails
    {
        stringof_emails .= x . " - " . Emails[x] . "`n"
    }

	try
	{
		RunWait, GlyphClientApp.exe, C:\Program Files (x86)\Steam\steamapps\common\Trove, 5
	}
	catch first_error
	{
		try
		{
			RunWait, GlyphClientApp.exe, S:\Steam\steamapps\common\Trove, 5
		}
		catch
		{
			Run, Autohotkey.exe Error_Display.ahk "GlyphClientApp.exe (Trove Dashboard) could not be found!`nEdit line 293 of Glyph_Login.ahk to your Trove directory"
		}
	}



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
	Gui, Add, Text, x12 y29 w220 h70, Made by BLURREDDOGE / JELLYMAN123                                                                      Copyright 2018`, Luke Roper`, All rights reserved. - https://www.gov.uk/copyright
	Gui, Add, Text, x12 y99 w220 h40, - You are free to edit this but under no circumstances`, without my written permission`, are you allowed to redistribute this code yourself.

	Gui, Tab, Emails
	Gui, Add, Button, x22 y25 w200 h190 gshowemails, Show Emails
	Gui, Show, x100 y225 h220 w240, Launcher
	return  ;pause at GUI for the user to continue with buttons

	showemails:
    {
        MsgBox,0,Emails,
        (
        Emails entered: `n%stringof_emails%
        )
    }
    return

	launchthemainscript:
    {
        Gui, Submit
        Gui, Destroy
    }


	if (launch_with_gui = 1)
	{
		Run, AutoHotkey.exe Option_Gui.ahk %OpenBackpack% %LaunchFishingBot% %RestartEveryDelay%
	}
	if (RestartEveryDelay = 1)
	{
		loop
		{
			window_setup(1, 0)
			Sleep, %normal_sleep%
			if (LaunchFishingBot)
			{
				Send, ^{Numpad1}  ;Nippy's fishing bot start all
			}
			if (OpenBackpack)
			{
				Run, AutoHotKey.exe Open_Backpack.ahk
			}
			loop, 30
			{
				WinKill, Client%A_Index%
			}
		}
	}
	else if !(RestartEveryDelay)
	{
		window_setup(1, 0)
		Sleep, %normal_sleep%
        if (LaunchFishingBot)
        {
            Send, ^{Numpad1}
        }
        if (OpenBackpack)
        {
            Run, AutoHotKey.exe Open_Backpack.ahk
        }
		ExitApp
	}
}
IfNotExist, database.txt
{
	MsgBox, You do not need to fill in all the boxes`, only the ones you want.
	Gui, New,, Create Email+Password Database
	Gui, Color, A9A9A9

	;			  Gui Group 1		   
	Gui, Add, groupbox, x10 y5 w180 h105
	Gui, Add, Text, x15 y15, Email 1:
	Gui, Add, Edit, w170 vEmail_One
	Gui, Add, Text, x15 y65, Password 1:
	Gui, Add, Edit, w170 Password vPassword_One
		;			  Gui Group 7			
		Gui, Add, groupbox, x200 y5 w180 h105
		Gui, Add, Text, x205 y15, Email 7:
		Gui, Add, Edit, w170 vEmail_Seven
		Gui, Add, Text, x205 y65, Password 7:
		Gui, Add, Edit, w170 Password vPassword_Seven
			;			  Gui Group 13			
			Gui, Add, groupbox, x390 y5 w180 h105
			Gui, Add, Text, x395 y15, Email 13:
			Gui, Add, Edit, w170 vEmail_Thirteen
			Gui, Add, Text, x395 y65, Password 13:
			Gui, Add, Edit, w170 Password vPassword_Thirteen
				;			  Gui Group 19			
				Gui, Add, groupbox, x580 y5 w180 h105
				Gui, Add, Text, x585 y15, Email 19:
				Gui, Add, Edit, w170 vEmail_Nineteen
				Gui, Add, Text, x585 y65, Password 19:
				Gui, Add, Edit, w170 Password vPassword_Nineteen
					;			  Gui Group 25			
					Gui, Add, groupbox, x770 y5 w180 h105
					Gui, Add, Text, x775 y15, Email 25:
					Gui, Add, Edit, w170 vEmail_TwentyFive
					Gui, Add, Text, x775 y65, Password 25:
					Gui, Add, Edit, w170 Password vPassword_TwentyFive
	;			  Gui Group 2			
	Gui, Add, groupbox, x10 y110 w180 h105
	Gui, Add, Text, x15 y120, Email 2:
	Gui, Add, Edit, w170 vEmail_Two
	Gui, Add, Text, x15 y170, Password 2:
	Gui, Add, Edit, w170 Password vPassword_Two
		;			  Gui Group 8			  
		Gui, Add, groupbox, x200 y110 w180 h105
		Gui, Add, Text, x205 y120, Email 8:
		Gui, Add, Edit, w170 vEmail_Eight
		Gui, Add, Text, x205 y170, Password 8:
		Gui, Add, Edit, w170 Password vPassword_Eight
			;			  Gui Group 14		      
			Gui, Add, groupbox, x390 y110 w180 h105
			Gui, Add, Text, x395 y120, Email 14:
			Gui, Add, Edit, w170 vEmail_Fourteen
			Gui, Add, Text, x395 y170, Password 14:
			Gui, Add, Edit, w170 Password vPassword_Fourteen
				;			  Gui Group 20		      
				Gui, Add, groupbox, x580 y110 w180 h105
				Gui, Add, Text, x585 y120, Email 20:
				Gui, Add, Edit, w170 vEmail_Twenty
				Gui, Add, Text, x585 y170, Password 20:
				Gui, Add, Edit, w170 Password vPassword_Twenty
					;			  Gui Group 26		      
					Gui, Add, groupbox, x770 y110 w180 h105
					Gui, Add, Text, x775 y120, Email 26:
					Gui, Add, Edit, w170 vEmail_TwentySix
					Gui, Add, Text, x775 y170, Password 26:
					Gui, Add, Edit, w170 Password vPassword_TwentySix
	;			  Gui Group 3			
	Gui, Add, groupbox, x10 y215 w180 h105
	Gui, Add, Text, x15 y225, Email 3:
	Gui, Add, Edit, w170 vEmail_Three
	Gui, Add, Text, x15 y275, Password 3:
	Gui, Add, Edit, w170 Password vPassword_Three
		;			  Gui Group 9			  
		Gui, Add, groupbox, x200 y215 w180 h105
		Gui, Add, Text, x205 y225, Email 9:
		Gui, Add, Edit, w170 vEmail_Nine
		Gui, Add, Text, x205 y275, Password 9:
		Gui, Add, Edit, w170 Password vPassword_Nine
			;			  Gui Group 15		  
			Gui, Add, groupbox, x390 y215 w180 h105
			Gui, Add, Text, x395 y225, Email 15:
			Gui, Add, Edit, w170 vEmail_Fifthteen
			Gui, Add, Text, x395 y275, Password 15:
			Gui, Add, Edit, w170 Password vPassword_Fiftheen
				;			  Gui Group 21		  
				Gui, Add, groupbox, x580 y215 w180 h105
				Gui, Add, Text, x585 y225, Email 21:
				Gui, Add, Edit, w170 vEmail_TwentyOne
				Gui, Add, Text, x585 y275, Password 21:
				Gui, Add, Edit, w170 Password vPassword_TwentyOne
					;			  Gui Group 27		  
					Gui, Add, groupbox, x770 y215 w180 h105
					Gui, Add, Text, x775 y225, Email 27:
					Gui, Add, Edit, w170 vEmail_TwentySeven
					Gui, Add, Text, x775 y275, Password 27:
					Gui, Add, Edit, w170 Password vPassword_TwentySeven
	;			  Gui Group 4			
	Gui, Add, groupbox, x10 y320 w180 h105
	Gui, Add, Text, x15 y330, Email 4:
	Gui, Add, Edit, w170 vEmail_Four
	Gui, Add, Text, x15 y380, Password 4:
	Gui, Add, Edit, w170 Password vPassword_Four
		;			  Gui Group 10			  
		Gui, Add, groupbox, x200 y320 w180 h105
		Gui, Add, Text, x205 y330, Email 10:
		Gui, Add, Edit, w170 vEmail_Ten
		Gui, Add, Text, x205 y380, Password 10:
		Gui, Add, Edit, w170 Password vPassword_Ten
			;			  Gui Group 16 		  
			Gui, Add, groupbox, x390 y320 w180 h105
			Gui, Add, Text, x395 y330, Email 16:
			Gui, Add, Edit, w170 vEmail_Sixteen
			Gui, Add, Text, x395 y380, Password 16:
			Gui, Add, Edit, w170 Password vPassword_Sixteen
				;			  Gui Group 22 		  
				Gui, Add, groupbox, x580 y320 w180 h105
				Gui, Add, Text, x585 y330, Email 22:
				Gui, Add, Edit, w170 vEmail_TwentyTwo
				Gui, Add, Text, x585 y380, Password 22:
				Gui, Add, Edit, w170 Password vPassword_TwentyTwo
					;			  Gui Group 28 		  
					Gui, Add, groupbox, x770 y320 w180 h105
					Gui, Add, Text, x775 y330, Email 28:
					Gui, Add, Edit, w170 vEmail_TwentyEight
					Gui, Add, Text, x775 y380, Password 28:
					Gui, Add, Edit, w170 Password vPassword_TwentyEight
	;			  Gui Group 5			
	Gui, Add, groupbox, x10 y425 w180 h105
	Gui, Add, Text, x15 y435, Email 5:
	Gui, Add, Edit, w170 vEmail_Five
	Gui, Add, Text, x15 y485, Password 5:
	Gui, Add, Edit, w170 Password vPassword_Five
		;			  Gui Group 11			  
		Gui, Add, groupbox, x200 y425 w180 h105
		Gui, Add, Text, x205 y435, Email 11:
		Gui, Add, Edit, w170 vEmail_Eleven
		Gui, Add, Text, x205 y485, Password 11:
		Gui, Add, Edit, w170 Password vPassword_Eleven
			;			  Gui Group 17			  
			Gui, Add, groupbox, x390 y425 w180 h105
			Gui, Add, Text, x395 y435, Email 17:
			Gui, Add, Edit, w170 vEmail_Seventeen
			Gui, Add, Text, x395 y485, Password 17:
			Gui, Add, Edit, w170 Password vPassword_Seventeen
				;			  Gui Group 23			  
				Gui, Add, groupbox, x580 y425 w180 h105
				Gui, Add, Text, x585 y435, Email 23:
				Gui, Add, Edit, w170 vEmail_TwentyThree
				Gui, Add, Text, x585 y485, Password 23:
				Gui, Add, Edit, w170 Password vPassword_TwentyThree
					;			  Gui Group 29			  
					Gui, Add, groupbox, x770 y425 w180 h105
					Gui, Add, Text, x775 y435, Email 29:
					Gui, Add, Edit, w170 vEmail_TwentyNine
					Gui, Add, Text, x775 y485, Password 29:
					Gui, Add, Edit, w170 Password vPassword_TwentyNine
	;			  Gui Group 6			
	Gui, Add, groupbox, x10 y530 w180 h105
	Gui, Add, Text, x15 y540, Email 6:
	Gui, Add, Edit, w170 vEmail_Six
	Gui, Add, Text, x15 y590, Password 6:
	Gui, Add, Edit, w170 Password vPassword_Six
		;			  Gui Group 12		  	  
		Gui, Add, groupbox, x200 y530 w180 h105
		Gui, Add, Text, x205 y540, Email 12:
		Gui, Add, Edit, w170 vEmail_Twelve
		Gui, Add, Text, x205 y590, Password 12:
		Gui, Add, Edit, w170 Password vPassword_Twelve
			;			  Gui Group 18		  	  
			Gui, Add, groupbox, x390 y530 w180 h105
			Gui, Add, Text, x395 y540, Email 18:
			Gui, Add, Edit, w170 vEmail_Eighteen
			Gui, Add, Text, x395 y590, Password 18:
			Gui, Add, Edit, w170 Password vPassword_Eighteen
				;			  Gui Group 24		  	  
				Gui, Add, groupbox, x580 y530 w180 h105
				Gui, Add, Text, x585 y540, Email 24:
				Gui, Add, Edit, w170 vEmail_TwentyFour
				Gui, Add, Text, x585 y590, Password 24:
				Gui, Add, Edit, w170 Password vPassword_TwentyFour
					;			  Gui Group 30		  	  
					Gui, Add, groupbox, x770 y530 w180 h105
					Gui, Add, Text, x775 y540, Email 30:
					Gui, Add, Edit, w170 vEmail_Thirty
					Gui, Add, Text, x775 y590, Password 30:
					Gui, Add, Edit, w170 Password vPassword_Thirty

	Gui, Add, Button, x10 y640 w940 gOK, Continue
	Gui, Show, w965 h675
	return

	OK:
    {
        Gui, Submit
        Gui, Destroy

        if (Email_One) and (Password_One){
            FileAppend, %Email_One%`n%Password_One%`n, database.txt
            }
        if (Email_Two) and (Password_Two){
            FileAppend, %Email_Two%`n%Password_Two%`n, database.txt
            }
        if (Email_Three) and (Password_Three){
            FileAppend, %Email_Three%`n%Password_Three%`n, database.txt
            }
        if (Email_Four) and (Password_Four){
            FileAppend, %Email_Four%`n%Password_Four%`n, database.txt
            }
        if (Email_Five) and (Password_Five){
            FileAppend, %Email_Five%`n%Password_Five%`n, database.txt
            }
        if (Email_Six) and (Password_Six){
            FileAppend, %Email_Six%`n%Password_Six%`n, database.txt
            }
        if (Email_Seven) and (Password_Seven){
            FileAppend, %Email_Seven%`n%Password_Seven%`n, database.txt
            }
        if (Email_Eight) and (Password_Eight){
            FileAppend, %Email_Eight%`n%Password_Eight%`n, database.txt
            }
        if (Email_Nine) and (Password_Nine){
            FileAppend, %Email_Nine%`n%Password_Nine%`n, database.txt
            }
        if (Email_Ten) and (Password_Ten){
            FileAppend, %Email_Ten%`n%Password_Ten%`n, database.txt
            }
        if (Email_Eleven) and (Password_Eleven){
            FileAppend, %Email_Eleven%`n%Password_Eleven%`n, database.txt
            }
        if (Email_Twelve) and (Password_Twelve){
            FileAppend, %Email_Twelve%`n%Password_Twelve%`n, database.txt
            }
        if (Email_Thirteen) and (Password_Thirteen){
            FileAppend, %Email_Thirteen%`n%Password_Thirteen%`n, database.txt
            }
        if (Email_Fourteen) and (Password_Fourteen){
            FileAppend, %Email_Fourteen%`n%Password_Fourteen%`n, database.txt
            }
        if (Email_Fifthteen) and (Password_Fifthteen){
            FileAppend, %Email_Fifthteen%`n%Password_Fifthteen%`n, database.txt
            }
        if (Email_Sixteen) and (Password_Sixteen){
            FileAppend, %Email_Sixteen%`n%Password_Sixteen%`n, database.txt
            }
        if (Email_Seventeen) and (Password_Seventeen){
            FileAppend, %Email_Seventeen%`n%Password_Seventeen%`n, database.txt
            }
        if (Email_Eighteen) and (Password_Eighteen){
            FileAppend, %Email_Eighteen%`n%Password_Eighteen%`n, database.txt
            }
        if (Email_Nineteen) and (Password_Nineteen){
            FileAppend, %Email_Nineteen%`n%Password_Nineteen%`n, database.txt
            }
        if (Email_Twenty) and (Password_Twenty){
            FileAppend, %Email_Twenty%`n%Password_Twenty%`n, database.txt
            }
        if (Email_TwentyOne) and (Password_TwentyOne){
            FileAppend, %Email_TwentyOne%`n%Password_TwentyOne%`n, database.txt
            }
        if (Email_TwentyTwo) and (Password_TwentyTwo){
            FileAppend, %Email_TwentyTwo%`n%Password_TwentyTwo%`n, database.txt
            }
        if (Email_TwentyThree) and (Password_TwentyThree){
            FileAppend, %Email_TwentyThree%`n%Password_TwentyThree%`n, database.txt
            }
        if (Email_TwentyFour) and (Password_TwentyFour){
            FileAppend, %Email_TwentyFour%`n%Password_TwentyFour%`n, database.txt
            }
        if (Email_TwentyFive) and (Password_TwentyFive){
            FileAppend, %Email_TwentyFive%`n%Password_TwentyFive%`n, database.txt
            }
        if (Email_TwentySix) and (Password_TwentySix){
            FileAppend, %Email_TwentySix%`n%Password_TwentySix%`n, database.txt
            }
        if (Email_TwentySeven) and (Password_TwentySeven){
            FileAppend, %Email_TwentySeven%`n%Password_TwentySeven%`n, database.txt
            }
        if (Email_TwentyEight) and (Password_TwentyEight){
            FileAppend, %Email_TwentyEight%`n%Password_TwentyEight%`n, database.txt
            }
        if (Email_TwentyNine) and (Password_TwentyNine){
            FileAppend, %Email_TwentyNine%`n%Password_TwentyNine%`n, database.txt
            }
        if (Email_Thirty) and (Password_Thirty){
            FileAppend, %Email_Thirty%`n%Password_Thirty%`n, database.txt
            }
        reload  ;We now have the accounts, lets get back to the program
    }
	return
}