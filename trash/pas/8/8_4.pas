const n = 255; {Не больше, set}
var 
	i: byte;
	S: set of byte;
function isPrime(n:byte):boolean;
	var
		k:byte;
		f:boolean;
	begin 
		if (n <= 2) then 
			isPrime:=true; {1 и 2 - простые}
		k:=2;
		f:=true;{Будем считать данное число простым...}
			while ((k<n) and f) do{сверяя его со всеми числами, меньше его...}
				if ((n mod k) = 0) then {если делится...}
					f:=false {... не простое!}
				else
					k:=k+1; {не делится -- переходим к следующему}
					{Если перед этим оказалось,что уже нет, то можно не увеличивать,
					все равно выйдем с цикла прямо сейчас}
		isPrime:=f;{Возращаем то, что насчитали -- ДА, если так и не нашли делителя,
					перебрав все числа меньше,НЕТ -- если вышли из цикла, найдя делитель}
	end;
BEGIN
	S:=[];
	i:=1;
	while (i*i < n) do begin
		if isPrime(i) then
			S:=S + [i*i];
		i:= i + 1;
		end;
	for i:=1 to n do
		if i in S then
			writeln(i);
END.