var i,n: integer;

function f(n: integer):double;
begin
    if (n=0) then
        f:=1
    else if (n=1) then
        f:=1
    else 
    {
        2f(n+2)=nf(n+1)-1       |n=n-2
        2f(n)=(n-2)f(n-1)-1     |/2
        f(n)=((n-2)f(n-1)-1)/2
    }
        f:=( (n-2) * f(n-1) - 1 ) / 2;
end;
      
BEGIN
    write('n = '); readln(n);
    for i:=0 to n do
        writeln('f(',i:3,') = ',f(i):12:5);
END.
