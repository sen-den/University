const
    n = 5;
var
    A: array [1..n] of integer;
    i, j: integer;
    f: boolean;
BEGIN
    for i:=1 to n do
        begin
            write('A[',i,'] = ');
            readln(A[i]);
        end;

    writeln('Min');
    for i:=1 to n do
        begin
            f:=true;
            for j:=1 to i-1 do
                if not (A[i] < A[j]) then
                    f:=false;
            if f then
                writeln('A[',i,'] = ',A[i]);
        end;
END.
