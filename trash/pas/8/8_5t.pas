const n = 255; {Не больше, set}
var 
	i,p,q: byte;
	S, S2: set of byte;
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
	for p:=1 to n do	{Перебираем все p}
		if isPrime(p) then {Для простых из них}
			for q:=1 to p-1 do {Перебираем все q, меньшее чем p (p-q > 0)}
				if isPrime(q) then {Для простых q}
					S:= S + [p-q];	{Добавляем их разницу в множество}
	
	for i:=1 to n do
		if i in S then
			for p:=1 to n do	{Перебираем все p}
				if isPrime(p) then {Для простых из них}
					for q:=1 to p-1 do {Перебираем все q, меньшее чем p (p-q > 0)}
						if isPrime(q) then {Для простых q}
							if ((p-q)=i) then
								writeln(p-q, ' = ', p, ' - ', q);

	S2:=[];
	for i:=1 to n do S2:=S2 + [i];
	for i:=1 to n do if i in S then S2:=S2-[i];
	for i:=1 to n do if i in S2 then writeln(i);
END.
