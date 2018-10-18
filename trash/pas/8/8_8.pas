const n = 255; {Max num of set elements}
var 
	i: byte;
	S: set of byte;
	S1, S2: set of byte; {4k+3, 5k+2}


BEGIN
	S:=[];
	S1:=[];
	S2:=[];
	i:=0;
	{generating sets}
	while (4*i+3 < n) do begin
		S1:=S1 + [4*i+3];
		i:= i + 1;
	end;
	i:=0;
	while (5*i+2 < n) do begin
		S2:=S2 + [5*i+2];
		i:= i + 1;
	end;

	S:=S1+S2; {union}

	{output union elements}
	for i:=1 to n do
		if i in S then
			writeln(i);
	
END.