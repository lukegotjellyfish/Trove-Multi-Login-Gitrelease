Global Transparency := 220
Global FontSize := 10

Gui, +AlwaysOnTop -Caption +Owner +LastFound +E0x20
Gui, Margin, 0, 0
Gui, Color, Grey
Gui, Font, cWhite s%FontSize% bold, Arial
Gui, Add, Text, x13 y13 w110 h20, Open backpack:
WinSet, Transparent, %Transparency%
Gui, Show, x0 y0 h136 w158