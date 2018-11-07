const
	n = 2;
	size = 2*n+1;
type
	Arr = array[1..size] of integer;
var
	i, tmp:integer;
	A: Arr;
	mid: integer;
	avg:double;

procedure Middle(A:Arr; var mid:integer); {Поиск среднего}
	var 
		i,j: integer;
		f: boolean;
	begin
		f:=true;
		while f do begin {Сортануть пузырьком}
			f:=false;
			for j:=1 to size-1 do
				if A[j]>A[j+1] then begin
					tmp:=A[j];
					A[j]:=A[j+1];
					A[j+1]:=tmp;
					f:=true;
					end;
			end;
		{for i:=1 to size do writeln(A[i]);}
		mid:=A[n+1]; {Будет центральным} 
		{В [1 2 3 4 5] средним будет 3, у нас количество - 2n+1, если n=2, то 3 это n+1}
	end;

procedure AvgArefmetic(A:Arr; var avg:double); {Chtlytt fhtavtnbxtcrjt}
	var 
		i, sum: integer;
	begin
		sum:=0;
		for i:=1 to size do 
			sum:=sum+A[i];
		avg:=sum/size; {Сумма на количество}
	end;

begin
	for i:=1 to size do begin {Заполняем}
		write('A[',i,'] = '); readln(A[i]);
		end;

	{Считаем}
	Middle(A, mid);
	AvgArefmetic(A, avg);

	{Определяем и отвечаем}
	if mid>avg then writeln('Middle > afifm average')
	else if avg>mid then writeln('Arifm average > middle')
	else writeln('Average = middle'); {Если не больше и не меньше, то равны}
	
end.