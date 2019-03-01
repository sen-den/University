var
	s:string;
	i, len:integer;
	F,G,Q:text;
BEGIN
	assign(F, 'f.txt');
	assign(G, 'g.txt');
	assign(Q, 'q.txt');
	reset(F);
	rewrite(G);
	rewrite(Q);

	read(F, s);
	close(F);

	while(pos('  ', s) > 0) do
		delete(s, pos('  ', s), 1);

	writeln(G, s);
	close(G);

	len:=length(s);
	for i:=1 to len-2 do
		if ((s[i] = ' ') and (s[i+2] = ' ')) then
			writeln(Q, s[i+1]);
	if (s[len-1] = ' ') then
		writeln(Q, s[len]);
	if (len >=2) then 
		if (s[2] = ' ') then
			writeln(Q, s[1]);

	close(Q);
END.
