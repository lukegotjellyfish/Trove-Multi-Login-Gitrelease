Array := [] ; or Array := Array()
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
		Passwords := Passwords . element . breakline
		if index = 2
			{
				Password_One := Password_One . element
			}
		if index = 4
			{
				Password_Two := Password_Two . element
			}
		if index = 6
			{
				Password_Three := Password_Three . element
			}
		if index = 8
			{
				Password_Four := Password_Four . element
			}	
	}
	else
	{
		Emails := Emails . element . breakline
		if index = 1
			{
				Email_One := element
			}
		if index = 3
			{
				Email_Two := element
			}
		 if index = 5
			{
				Email_Three := element
			}	
		 if index = 7
			{
				Email_Four := element
			}
	}
}

MsgBox %Passwords%
MsgBox %Emails%
;MsgBox %Email_Three%
