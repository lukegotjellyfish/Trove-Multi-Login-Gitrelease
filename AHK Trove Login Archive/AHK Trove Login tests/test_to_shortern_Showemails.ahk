
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
			global Password_One := element
		}
		if index = 4
		{
			global Password_Two := element
		}
		if index = 6
		{
			global Password_Three := element
		}
		if index = 8
		{
			global Password_Four := element
		}	
		if index = 10
		{
			global Password_Five := element
		}
		if index = 12
		{
			global Password_Six := element
		}
		if index = 14
		{
			global Password_Seven := element
		}
		if index = 16
		{
			global Password_Eight := element
		}
		if index = 18
		{
			global Password_Nine := element
		}
		if index = 20
		{
			global Password_Ten := element
		}
		if index = 22
		{
			global Password_Eleven := element
		}
		if index = 24
		{
			global Password_Twelve := element
		}
		if index = 26
		{
			global Password_Thirteen := element
		}
		if index = 28
		{
			global Password_Fourteen := element
		}
		if index = 30
		{
			global Password_Fifthteen := element
		}
		if index = 32
		{
			global Password_Sixteen := element
		}
		if index = 34
		{
			global Password_Seventeen := element
		}
		if index = 36
		{
			global Password_Eighteen := element
		}
		if index = 38
		{
			global Password_Nineteen := element
		}
		if index = 40
		{
			global Password_Twenty := element
		}
		if index = 42
		{
			global Password_TwentyOne := element
		}
		if index = 44
		{
			global Password_TwentyTwo := element
		}
		if index = 46
		{
			global Password_TwentyThree := element
		}
		if index = 48
		{
			global Password_TwentyFour := element
		}
		if index = 50
		{
			global Password_TwentyFive := element
		}
		if index = 52
		{
			global Password_TwentySix := element
		}
		if index = 54
		{
			global Password_TwentySeven := element
		}
		if index = 56
		{
			global Password_TwentyEight := element
		}
		if index = 58
		{
			global Password_TwentyNine := element
		}
		if index = 60
		{
			global Password_Thirty := element
		}
	}
	else
	{
		Emails := element . breakline
		if index = 1
		{
			global Email_One := element
		}
		if index = 3
		{
			global Email_Two := element
		}
		 if index = 5
		{
			global Email_Three := element
		}	
		 if index = 7
		{
			global Email_Four := element
		}
		if index = 9
		{
			global Email_Five := element
		}
		if index = 11
		{
			global Email_Six := element
		}
		if index = 13
		{
			global Email_Seven := element
		}
		if index = 15
		{
			global Email_Eight := element
		}
		if index = 17
		{
			global Email_Nine := element
		}
		if index = 19
		{
			global Email_Ten := element
		}
		if index = 21
		{
			global Email_Eleven := element
		}
		if index = 23
		{
			global Email_Twelve := element
		}
		if index = 25
		{
			global Email_Thirteen := element
		}
		if index = 27
		{
			global Email_Fourteen := element
		}
		if index = 29
		{
			global Email_Fifthteen := element
		}
		if index = 31
		{
			global Email_Sixteen := element
		}
		if index = 33
		{
			global Email_Seventeen := element
		}
		if index = 35
		{
			global Email_Eighteen := element
		}
		if index = 37
		{
			global Email_Nineteen := element
		}
		if index = 39
		{
			global Email_Twenty := element
		}
		if index = 41
		{
			global Email_TwentyOne := element
		}
		if index = 43
		{
			global Email_TwentyTwo := element
		}
		if index = 45
		{
			global Email_TwentyThree := element
		}
		if index = 47
		{
			global Email_TwentyFour := element
		}
		if index = 49
		{
			global Email_TwentyFive := element
		}
		if index = 51
		{
			global Email_TwentySix := element
		}
		if index = 53
		{
			global Email_TwentySeven := element
		}
		if index = 55
		{
			global Email_TwentyEight := element
		}
		if index = 57
		{
			global Email_TwentyNine := element
		}
		if index = 59
		{
			global Email_Thirty := element
		}
	}
}
spaceforemaillist := Chr(160)
if Email_One{
stringof_emails = %stringof_emails% %spaceforemaillist% 1: %Email_One%  `n
}
if Email_Two{
stringof_emails = %stringof_emails%  2: %Email_Two%  `n
}
if Email_Three{
stringof_emails = %stringof_emails%  3: %Email_Three%  `n
}
if Email_Four{
stringof_emails = %stringof_emails%  4: %Email_Four%  `n
}
if Email_Five{
stringof_emails = %stringof_emails%  5: %Email_Five%  `n
}
if Email_Six{
stringof_emails = %stringof_emails%  6: %Email_Six%  `n
}
if Email_Seven{
stringof_emails = %stringof_emails%  7: %Email_Seven%  `n
}
if Email_Eight{
stringof_emails = %stringof_emails%  8: %Email_Eight%  `n
}
if Email_Nine{
stringof_emails = %stringof_emails%  9: %Email_Nine%  `n
}
if Email_Ten{
stringof_emails = %stringof_emails%  10: %Email_Ten%  `n
}
if Email_Eleven{
stringof_emails = %stringof_emails%  11: %Email_Eleven%  `n
}
if Email_Twelve{
stringof_emails = %stringof_emails%  12: %Email_Twelve%  `n
}
if Email_Thirteen{
stringof_emails = %stringof_emails%  13: %Email_Thirteen%  `n
}
if Email_Fourteen{
stringof_emails = %stringof_emails%  14: %Email_Fourteen%  `n
}
if Email_Fithteen{
stringof_emails = %stringof_emails%  15: %Email_Fithteen%  `n
}
if Email_Sixteen{
stringof_emails = %stringof_emails%  16: %Email_Sixteen%  `n
}
if Email_Seventeen{
stringof_emails = %stringof_emails%  17: %Email_Seventeen%  `n
}
if Email_Eighteen{
stringof_emails = %stringof_emails%  18: %Email_Eighteen%  `n
}
if Email_Nineteen{
stringof_emails = %stringof_emails%  19: %Email_Nineteen%  `n
}
if Email_Twenty{
stringof_emails = %stringof_emails%  20: %Email_Twenty%  `n
}
if Email_TwentyOne{
stringof_emails = %stringof_emails%  21: %Email_TwentyOne%  `n
}
if Email_TwentyTwo{
stringof_emails = %stringof_emails%  22: %Email_TwentyTwo%  `n
}
if Email_TwentyThree{
stringof_emails = %stringof_emails%  23: %Email_TwentyThree%  `n
}
if Email_TwentyFour{
stringof_emails = %stringof_emails%  24: %Email_TwentyFour%  `n
}
if Email_TwentyFive{
stringof_emails = %stringof_emails%  25: %Email_TwentyFive%  `n
}
if Email_TwentySix{
stringof_emails = %stringof_emails%  26: %Email_TwentySix%  `n
}
if Email_TwentySeven{
stringof_emails = %stringof_emails%  27: %Email_TwentySeven%  `n
}
if Email_TwentyEight{
stringof_emails = %stringof_emails%  28: %Email_TwentyEight%  `n
}
if Email_TwentyNine{
stringof_emails = %stringof_emails%  29: %Email_TwentyNine%  `n
}
if Email_Thirty{
stringof_emails = %stringof_emails%  30: %Email_Thirty%  `n
}
MsgBox,0,Emails,
(
%spaceforheadder%Emails entered: 
%stringof_emails%
)