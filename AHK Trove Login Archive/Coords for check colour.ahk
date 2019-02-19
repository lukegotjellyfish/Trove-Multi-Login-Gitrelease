Check_for_pop-up_on_lauch()
{
	WinGetPos, , , WinW, WinH, A
	WinWh := WinW//1.9
	WinHh := WinH//8.3
	WinWw := WinW//18
	WinHw := WinH//19
	WinWf := WinWh-WinWw
	WinHf := WinHh+WinHw
	PixelGetColor, col, WinWf, WinHf, RGB
	return col
}