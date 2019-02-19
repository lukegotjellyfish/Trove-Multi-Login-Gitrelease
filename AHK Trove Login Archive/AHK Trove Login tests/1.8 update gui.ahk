UpdateGUI()
{
	if RestartEveryDelay = 1
	{
		thing3status := 1
	}
	if OpenBackpack = 1
	{
		thing1status := 1
	}
	if LaunchFishingBot = 1
	{
		thing2status := 1
	}
	if fishing_auto_delete = 1
	{
		thing4status := 1
	}

	if !(RestartEveryDelay)
	{
		thing3status := 0
	}
	if !(OpenBackpack)
	{
		thing1status := 0
	}
	if !(LaunchFishingBot)
	{
		thing2status := 0
	}
	if !(fishing_auto_delete)
	{
		thing4status := 0
	}
GuiControl,     ,thing1status, %thing1status%
GuiControl,     ,thing2status, %thing2status%
GuiControl,     ,thing3status, %thing3status%
GuiControl,     ,thing4status, %thing4status%
Gui, Show, x0 y0 h136 w158
return
}