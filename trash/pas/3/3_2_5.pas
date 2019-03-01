var s, i:integer;
begin 
	s:= 0;
	for i:= 0 to 10 do
		if ((i mod 2) = 0) then s:= s + i;
	write(s);
end.
