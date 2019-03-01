var 
	n, i: integer;	
	mul:real;
begin
	mul:= 1;
	write('n='); readln(n);
	for i:=1 to n do
			mul:= mul * (1 + 1/(i*i));
	writeln(mul:0:3);	
end.
