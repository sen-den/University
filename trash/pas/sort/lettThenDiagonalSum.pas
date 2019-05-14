const 
	n = 2;
var
	A: array[1..n, 1..n] of integer;
	i, j, diaSum: integer;
BEGIN
	writeln('Input elements');

	for i:=1 to n do
		for j:=1 to n do
			readln(A[i,j]);

	diaSum:=0;
	for i:=1 to n do
		diaSum:=diaSum + A[i, i];

	writeln('Sum: ', diaSum);

	for i:=1 to n do
		for j:=1 to n do
			if (A[i, j] < diaSum) then
				writeln ('A[',i,', ',j,'] = ',A[i, j]);

END.
