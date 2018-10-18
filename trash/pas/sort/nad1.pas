const
    n = 2;
    m = 2;
var 
    i, j: integer;
    maxI, maxS, S: integer;
    A: array[1..n, 1..m] of integer;
BEGIN
    for i:=1 to n do
        for j:=1 to m do
            begin
                write('A[',i,',',j,'] = ');
                readln(A[i, j]);
            end;

    maxI := 1;

    for i:=1 to n do
        begin
            S:=0;
            for j:=1 to m do
                S:=S + A[i,j]*A[i,j];
        
            if (i = 1) then
                maxS := S;

            if (S > maxS) then
                begin
                    maxI := i;
                    maxS := S;
                end;
        end;

    writeln('The largest sum is ', maxS, ' in ', maxI, ' line.');
END.



