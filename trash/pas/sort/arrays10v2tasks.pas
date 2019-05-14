const
	n = 5;
var
	A: array [1..n] of real;
	i, minI, firstNegI, secondNegI: integer;
	multiplication, min: real;

BEGIN
	writeln('Input array');
	for i:=1 to n do
		readln(A[i]);

	minI:=1;
	min:=A[minI];
	for i:=1 to n do
		if (A[i] < min) then begin
			minI:= i;
			min:= A[i];
		end;


	writeln('Min is ', minI, ' = ', min);

	firstNegI:=1;
	while (A[firstNegI] >= 0) do
		firstNegI:=firstNegI + 1;
	
	secondNegI:=firstNegI + 1;
	while (A[secondNegI] >= 0) do
		secondNegI:=secondNegI + 1;


	writeln(firstNegI, ' ', secondNegI);

	multiplication:=1;

	for i:=firstNegI + 1 to secondNegI - 1 do
		multiplication:=multiplication * A[i];

	writeln('multiplication = ', multiplication);

END.
