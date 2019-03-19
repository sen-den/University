var
	fileName, line: string;
	f: text;
	count: integer;
BEGIN
	write('File name: '); readln(fileName);

	assign(f, fileName);
	reset(f);

	count := 0;
	repeat
		readln(f, line);
		if ((length(line) > 0) and (line[1] = 'a')) then
			count := count + 1;
	until (EOF(f));

	writeln(count);

END.
