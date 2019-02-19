#SingleInstance, force

global SleepTimer := 15
global StopValue := 0
global TimePast := 0
global OKSleep := 0
global RanArray := []

IniRead, SleepTimer, config.ini, Settings, SleepTimer
IniRead, OKSleep, config.ini, Settings, OKSleep

Gui, Add, Tab, W300 H300, General|Settings

Gui, Tab, General
Gui, Color, White
Gui, +AlwaysOnTop
Gui, font, s7
Gui, Add, Button, gGetPids, Get Window PIDS
Gui, Add, Text, vCurrentAction, Nothing Yet
Gui, Add, Button, gStartBtn, Start Bot
Gui, Add, Button, gStopBtn, Stop Bot
Gui, Add, Text, x80 y113, Stops Once Loop Is Done

Gui, Tab, Settings
Gui, Color, WHite
Gui, +AlwaysOnTop
Gui, font, s7
Gui, Add, Text, , Sleep Between Each Delete:
Gui, Add, Edit, x250 y32 vSleepTimer, %SleepTimer%
Gui, Add, Text, x20 y60, Sleep Between Clicking MButton And OK In Ms:
Gui, Add, Edit, x250 y57 vOKSleep, %OKSleep%
Gui, Add, Button, x20 y80 gSaveSettingsBtn, Save Settings

Gui, Show, x0 y0 W300 H300,

return

GetPids:

GetPIDs()

return

StartBtn:

StopValue := 0
MainLoop()

return


StopBtn: 

StopValue := 1

return

SaveSettingsBtn:

Gui, Submit, NoHide
IniWrite, %SleepTimer%, config.ini, Settings, SleepTimer
IniWrite, %OKSleep%, config.ini, Settings, OKSleep

return

MainLoop() {

outer:
loop {

for index, element in RanArray
{
GuiControl, Text, CurrentAction, Deleting_Items
GuiControl, Move, CurrentAction, W500

CurrentWindowAct := element

WinActivate, ahk_pid %CurrentWindowAct%

sleep, 1000

MouseMove, 1587, 453
Send, {MButton}
sleep, %OKSleep%
Click, 868, 471
MouseMove, 1657, 455
Send, {MButton}
sleep, %OKSleep%
Click, 868, 471
MouseMove, 1725, 452
Send, {MButton}
sleep, %OKSleep%
Click, 868, 471
MouseMove, 1794, 454
Send, {MButton}
sleep, %OKSleep%
Click, 868, 471
MouseMove, 1865, 455
Send, {MButton}
sleep, %OKSleep%
Click, 868, 471
MouseMove, 1587, 519
Send, {MButton}
sleep, %OKSleep%
Click, 868, 471
MouseMove, 1655, 517
Send, {MButton}
sleep, %OKSleep%
Click, 868, 471
MouseMove, 1726, 519
Send, {MButton}
sleep, %OKSleep%
Click, 868, 471
MouseMove, 1795, 517
Send, {MButton}
sleep, %OKSleep%
Click, 868, 471
MouseMove, 1865, 519
Send, {MButton}
sleep, %OKSleep%
Click, 868, 471

loop %SleepTimer%
{
TimePast := TimePast + 1
sleep, 1000
GuiControl, Text, CurrentAction, Time Until Next Deletion: %TimePast%
GuiControl, Move, CurrentAction, W300
}
TimePast := 0

if StopValue = 1
{
break outer
}
}
}
}

return


GetPIDs() {

GuiControl, Text, CurrentAction, Getting_PIDs
GuiControl, Move, CurrentAction, W500

pidU = 
RanArray := []

WinGet,l,list,ahk_exe Trove.exe
WinGet,currentPid,pid,A
WinGet,name,ProcessName,ahk_pid %currentPid%
if(name!="Trove.exe")
ToolTip
loop %l%{
WinGet,pidU,PID,% "ahk_id " l%a_index%
RanArray.Insert(pidU)
}
GuiControl, Text, CurrentAction, Bot_Ready
GuiControl, Move, CurrentAction, W500
}

return

ESC::ExitApp

return