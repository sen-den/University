

var
	str: String;
BEGIN
	write('String: ');
	readln(str);

	while(Pos('..', str) > 0) do
		delete(str, Pos('..', str), 1);

	writeln(str)

END.
