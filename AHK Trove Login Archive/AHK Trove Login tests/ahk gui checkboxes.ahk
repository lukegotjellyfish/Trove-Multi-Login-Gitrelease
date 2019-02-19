Gui, Add, Tab, x-6 y0 w250 h160, Launch Options|Info

Gui, Tab, Launch Options
Gui, Add, CheckBox, x32 y29 w150 h20 vOpenBackpack, Open backpack on launch
Gui, Add, CheckBox, x32 y48 w150 h30 vLaunchFishingBot, Start Nippy's fishing bot upon launch
Gui, Add, CheckBox, x32 y80 w150 h30 vRestartEveryHour, Restart clients every hour
Gui, Add, Button, x22 y109 w200 h40 glaunchthemainscript, Launch

Gui, Tab, Info
Gui, Add, Text, x12 y29 w220 h70, Made by BLURREDDOGE / JELLYMAN123                                                                      Copyright 2018`, Luke Roper`, All rights reserved. - https://www.gov.uk/copyright
Gui, Add, Text, x12 y99 w220 h40 +Border, - You are free to edit this but under no circumstances`, without my written permission`, are you allowed to redistribute this code yourself.
Gui, Show, x1100 y225 h158 w240, New GUI Window
return

launchthemainscript:
Gui, Submit
if (OpenBackpack = 1) and (LaunchFishingBot = 1)
	{
		MsgBox, Startting: with both enabled
		global OpenBackpack 
		OpenBackpack = 1
		global LaunchFishingBot
		LaunchFishingBot = 1
	}
if RestartEveryHour = 1
	{
		global RestartEveryDelay
		RestartEveryDelay = 1
	}
else if OpenBackpack = 1
	{
		MsgBox, Starting: will open backpack on all accounts when all are logged-in
		global OpenBackpack 
		OpenBackpack = 1
	}
else if LaunchFishingBot = 1
	{
		MsgBox, Starting: will enable Nippy's fishing bot for all accounts when all are logged-in
		global LaunchFishingBot
		LaunchFishingBot = 1
	}