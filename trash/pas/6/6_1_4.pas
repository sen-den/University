function GOD(a,b:integer):integer;
begin
  while a<>b do
    if a>b then a:=a-b else b:=b-a;
 GOD:=a;
end;

function LCM(a,b:integer):integer;
begin
  LCM:=a*b div GOD(a,b)
end;

var a:array[1..100] of integer;
    n,i:integer;
    g,l:integer;

begin
write('Size of array (1..100) = ');
readln(n);

writeln('Array elements: ');
for i:=1 to n do
begin
  write('A[',i,']=');
  readln(a[i]);
end;

g:=GOD(a[1],a[2]);
l:=LCM(a[1],a[2]);
for i:=3 to n do g:=GOD(g,a[i]);
for i:=3 to n do l:=LCM(l,a[i]);
writeln('GOD(A) = ',g);
WriteLn('LCM(A) = ',l)
end.
