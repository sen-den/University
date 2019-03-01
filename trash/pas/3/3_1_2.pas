program tabulator;
const
{То, что дано в таблице вставим в константы.}
  a = 0;
  b = 1;
  c = 0;
  d = 2;
  h = 0.1;
var x, y, i:real;
BEGIN


  y:= c - h;

  while (y <= d) do
  begin
  
    x:= a-h;
    y:= y + h;

    while (x <= b) do
    begin

      x:= x + h;

      writeln('f(',
        x:3:1,'; ',
        y:3:1,') = ',
        (exp((-1)*x*x-(y*y))):5:3
      );
    end;

    writeln();
  end;

END.
