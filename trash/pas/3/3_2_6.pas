var a, b: integer;
begin
	b:= 0;
	write('a='); readln(a);
	while (a>0) do begin
		a:= a div 10; 
		b:= b + 1;
	end;
	writeln(b);
end.
