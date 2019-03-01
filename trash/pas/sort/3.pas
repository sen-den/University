program v3;
var
  x1,x2,y1,y2,x3,y3:integer;
  l1,l2,l3:double;

function lineLength(ax,ay,bx,by:integer):double;
  begin
    lineLength := sqrt((ax-bx)*(ax-bx) + (ay-by)*(ay-by))
  end;

BEGIN
  write('x1 = '); readln(x1);
  write('y1 = '); readln(y1);
  write('x2 = '); readln(x2);
  write('y2 = '); readln(y2);
  write('x3 = '); readln(x3);
  write('y3 = '); readln(y3);

  l1 := lineLength(x1,y1,x2,y2);
  l2 := lineLength(x1,y1,x3,y3);
  l3 := lineLength(x2,y2,x3,y3);

  write('Shortest is: ');
  if ((l1 <= l2) and (l1 <= l3)) then writeln('AB = ', l1) else
  if ((l2 <= l1) and (l2 <= l3)) then writeln('AC = ', l2) else
  if ((l3 <= l2) and (l3 <= l1)) then writeln('BC = ', l3);

END.
