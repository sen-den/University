program farestPoint;
const 
	n = 3;
var
	X, Y: array[1..n] of double;
	i, maxI: integer;
	maxLen: double;

function length(xc, yc:double): double;
	begin
		length:= sqrt(xc*xc + yc*yc);
	end;

BEGIN
	for i:=1 to n do
		begin
			writeln('Point ', i, '; x, y:');
			read(X[i]); readln(Y[i]);
		end;

	maxI := 1;
	maxLen := length(X[1], Y[1]);
	for i:=2 to n do
		if (length(X[i], Y[i]) > maxLen) then
			begin
				maxI := i;
				maxLen := length(X[i], Y[i]);
			end;

	writeln('The farest point is ', maxI, ' (', X[maxI], ' ;', Y[maxI], '), length is ', maxLen);
END.
