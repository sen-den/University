var i,n: integer;

function f(n: integer):integer;
begin
    if (n=0) then
        f:=0
    else if (n=1) then
        f:=1
    else if (n mod 2 = 0) then
        {
            f(2k)=2f(k)+1 =>
            f(k)=2f(k/2)+1
        }
        f:=2*f(n div 2) + 1
    else
        {
            f(2k+1)=f(k+1)-1 =>
            f(2k)=f(k)-1 =>
            f(k)=f(k/2)-1 
        }
        f:=f((n-1) div 2 + 1) - 1;
end;
      
BEGIN
    write('n = '); readln(n);
    for i:=0 to n do
        writeln('f(',i,') = ',f(i));
END.
