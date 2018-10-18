const
    n = 2;
var
    i, k, sum, iMid:integer;
    arifMid: double;
    A: array [1..2*n+1] of integer;
BEGIN
    k:= 2*n+1;
    for i:=1 to k do
        begin
            write('A[',i,']= ');
            readln(A[i]);
        end;

    sum := 0;
    for i:=1 to k do sum:=sum + A[i];
    arifMid := sum / k;

    iMid := 1;

    for i:=1 to k do
        if (abs(A[i] - arifMid) < abs(A[iMid] - arifMid)) then
            iMid := i;

    writeln('Медиана массива: ', A[iMid]);
END.
