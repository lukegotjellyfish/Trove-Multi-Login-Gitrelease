#Persistent
OnExit("CloseFunction")





OnExit(ObjBindMethod(GlyphLoginExit, "DoBeforeExit"))

CloseFunction(ExitFor, ExitCode)
{
    if ExitFor not in Logoff,Shutdown
    {
        MsgBox, 4, , Do you want to close %A_ScriptName%?
        IfMsgBox, No
		{
            return 1
		}
    }
}
class GlyphLoginExit
{
    DoBeforeExit()
    {
		MsgBox,,, %A_ScriptName% is closing..., 0.6
		Send, {Shift Down}
		Send, {Shift Up}
    }
}