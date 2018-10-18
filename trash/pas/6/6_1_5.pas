const
	size = 5;
var
	i, minX, maxX, minY, maxY:integer;
	X: array[1..size] of integer;
	Y: array[1..size] of integer;

procedure MinMax(A:array of integer; var minV:integer; var maxV:integer);
	var 
		i: integer;
		min, max: integer;
	begin
		min:=A[1]; max:=A[1];
		for i:= 0 to size-1 do begin
			if A[i] < min then
				min:=A[i];
			if A[i] > max then
				max:=A[i];

			end;
		minV:=min;
		maxV:=max;
	end;

begin
	for i:=1 to size do begin
		write(i, ' point X = '); readln(X[i]);
		write(i, ' point Y = '); readln(Y[i]);
		end;

	writeln(''); writeln('Points:');
	for i:=1 to size do writeln ('(', X[i], '; ', Y[i], ');');

	MinMax(X, minX, maxX);
	MinMax(Y, minY, maxY);

	writeln('Rectangle is (', minX, '; ', minY, ')(', maxX, '; ', maxY, ').');
end.