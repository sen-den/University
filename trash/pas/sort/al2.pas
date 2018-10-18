procedure Nod(a,b:integer; var d:integer);{определение НОД двух чисел}
begin
	while a<>b do
	 	if a>b then a:=a-b else b:=b-a;
	d:= a;
end;
 
var a:array[1..100] of integer;
    n,i:byte;
    k, p, z:integer;
begin

write('Введите кол-во элементов n=');
readln(n);
writeln('Введите элементы массива: ');
for i:=1 to n do
	begin
		write('a[',i,']=');
		readln(a[i]);
	end;

writeln('Массив:');
for i:=1 to n do
	write(a[i],' ');
writeln;

Nod(a[1],a[2], k);
for i:=3 to n do nod(k,a[i],k);
writeln('Общий НОД всех элементов=',k);

p := 1;
for i:=1 to n do p := p * a[i];
z := p div k; {NOK}

writeln('NOK: ', z);

end.
