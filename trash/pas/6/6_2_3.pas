var
	a,b,c:double;

function arccos(a:double):double;
	begin
		{Формула из интернета}
		arccos:=arctan(sqrt(1-sqr(cos(a)))/cos(a));
	end;

begin
	write('a = ');readln(a);
	write('b = ');readln(b);
	write('c = ');readln(c);
	{cos(ax+b) = c}
	{x = (acos(c)-b) /a}
	{Наверное}
	writeln((arccos(c)-b)/a);

end.