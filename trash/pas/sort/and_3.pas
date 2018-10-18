var i,n: integer;

function f(n: integer):integer;
begin
    if (n=0) then
        f:=1
    else if (n=1) then
        f:=1
    else 
        {
            f(n+2)=2f(n+1)-n+1  |-2
            f(n)=2f(n-2+1)-n-2+1
            f(n)=2f(n-1)-n-1
        }
        f:=2*f(n-1) - n - 1;
end;
      
BEGIN
    write('n = '); readln(n);
    for i:=0 to n do
        writeln('f(',i,') = ',f(i));
END.
