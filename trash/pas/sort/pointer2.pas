type 
	point = ^item;
	item = record
		dat:integer;
		bot,top: point;
	end;

var p, first:point;

begin
	new(p); {1}
	first:=p;		write('Input 1 element: ');	readln(p^.dat);
	new(p^.top);	write('Input 2 element: '); readln(p^.top^.dat);
	new(p^.bot);	write('Input 5 element: '); readln(p^.bot^.dat);
	
	p:=p^.top; {2}
	new(p^.top);	write('Input 3 element: '); readln(p^.top^.dat);
	new(p^.bot);	write('Input 6 element: '); readln(p^.bot^.dat);
	p^.top^.top:=first; {3 top = 1}
	p^.top^.bot:=nil; {3 bot}

	p:=p^.bot; {6}
	new(p^.bot);	write('Input 4 element: '); readln(p^.bot^.dat);
	
	p^.top:=nil; {6 top}

	p:=p^.bot; {4}
	p^.top:=first^.top;
	p^.bot:=first^.bot;

	p:=p^.bot; {5}
	p^.top:=first^.top^.top;
	p^.bot:=nil;

	p:=p^.top; {3}
	p^.top:=first;

	write('x1,x2,x3,x1: ');
	write(first^.dat,' ');	p:=first^.top;
	write(p^.dat,' '); 		p:=p^.top;
	write(p^.dat,' '); 		p:=p^.top;
	write(p^.dat,' ');
	writeln();
	write('x1,x5,x3: ');
	write(first^.dat,' ');	p:=first^.bot;
	write(p^.dat,' '); 		p:=p^.top;
	write(p^.dat,' ');
	writeln();
	write('x1,x2,x6,x4,x5: ');
	write(first^.dat,' ');	p:=first^.top;
	write(p^.dat,' '); 		p:=p^.bot;
	write(p^.dat,' '); 		p:=p^.bot;
	write(p^.dat,' '); 		p:=p^.bot;
	write(p^.dat,' ');
	writeln();
end.
