var a,b,c,ma,mb,mc: real;
BEGIN
	Write('Length of a: ');	Readln(a);
	Write('Length of a: ');	Readln(b);
	Write('Length of a: ');	Readln(c);

	{Median to a is 0.5\/(2b^2+2c^2-a^2)| }
	mc:=sqrt(2*a*a+2*b*b-c*c)/2;
	mb:=sqrt(2*a*a+2*c*c-b*b)/2;
	ma:=sqrt(2*c*c+2*b*b-a*a)/2;
	Writeln(
		'Medians: ',
		ma:2:2,' ',
		mb:2:2,' ',
		mc:2:2
		);
END.
