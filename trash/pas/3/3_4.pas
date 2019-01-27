var i,n: integer;

function f(n: integer):integer;
begin
    if (n=0) then
        f:=0
    else if (n=1) then
        f:=2
    else if (n=2) then
        f:=4
    else 
        {
            f(n+3) = f(n+2)-2*(n+1) ===
            f(n) = f(n-1)-2*(n-2)
        }
        f:=f(n-1) - 2*(n-2);
end;
      
BEGIN
    write('n = '); readln(n);
    for i:=0 to n do
        writeln('f(',i,') = ',f(i));
END.
