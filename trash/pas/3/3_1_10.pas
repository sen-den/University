program tabulator;
const
	{То, что дано в таблице вставим в константы.}
	a = 0;
	b = 0.7853;
	c = 0;
	d = 0.34906585;
	h = 0.04;
var
	x, y:real;
BEGIN
	y:= c - h;

	while (y <= d) do
		begin
			{на каждом шаге по У увеличиваем его на шаг и 
			"обнуляем" Х его начальным значением минус шаг.}
			x:= a-h;
			y:= y + h;

			while (x <= b) do
				begin
					{На каждом шаге по Х увеличиваем его на шаг}
					x:= x + h;
					{и выводим функцию от текущих значений.
					два числа через двоеточия после переменной это,
					соответственно, сколько символов под нее вывести всего,
					и сколько знаков после запятой оставить.}
					writeln('f(',
					x:3:2,'; ',
					y:3:2,') = ',
					(cos(x)+sin(3*y)):5:3
					);
				end;
			{После каждого круга по Х просто выводим пустую строку,
			так вывод читать легче.}
			writeln();
		end;

END.
