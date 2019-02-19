check_for_crashed_clients(6)

check_for_crashed_clients(emailnum)
{
	num := (emailnum - emailnum) + 1
	loop %emailnum%
	{
		client_name := "Client" . num
		num := num + 1
		if !WinExist(client_name)
		{
			MsgBox, %client_name% doesn't exist
		}
	}
}