var
	s:string;
	i:integer;
	b: boolean;
	F,G:text;
BEGIN
	assign(F, 'f.txt');
	assign(G, 'g.txt');
	reset(F);
	rewrite(G);

	repeat
		readln(F, s);
		b:= false;
		for i:=1 to (length(s)-1) do
			if s[i] = s[i+1] then
				b:= true;
		if b then
			writeln(G, s, ' ');
	until EOF(F);

	close(F);
	close(G);
END.
