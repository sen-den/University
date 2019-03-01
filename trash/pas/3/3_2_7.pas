var a, i:integer;
begin
	write('a='); readln(a);
	for i:=1 to a do
		if (a mod i = 0) then
			writeln(i);
end.
