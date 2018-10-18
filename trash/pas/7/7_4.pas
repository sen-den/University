Uses sysutils;
const 
	nOfbooks = 2; {predefined number of books be used enywhere farther}
	tableTop = '╔══════════╦════════╦════════╗';
	tableMid = '╠══════════╬════════╬════════╣';
	tableBot = '╚══════════╩════════╩════════╝';
type
	book=record
		clas:integer;
		title:string;
		author:string;
		year:integer;
	end;
var	
	books:array[1..nOfbooks] of book;
	i,sum:integer;
	find:integer;
begin
	{Filling array of books}
	for i:=1 to nOfbooks do begin 
		writeln('');
		writeln(i,' book:');
		write('Clas:', '':5);
		readln(books[i].clas);
		write('Title:', '':5);
		readln(books[i].title);
		write('Author:', '':4);
		readln(books[i].author);
		write('Year:', '':6);
		readln(books[i].year);
	end;

	writeln('');
	write('Book clas for search: ');readln(find);

	sum:=0;
	{Output all as table}
	writeln(tableTop);
	writeln('║Title     ║author  ║year    ║');
	for i:=1 to nOfbooks do
		if books[i].clas = find then
		begin
			writeln(tableMid);
			writeln(
				'║', books[i].title, '':(10-length(books[i].title)),
				'║', books[i].author, '':(8-length(books[i].author)),
				'║', books[i].year, '':(8-length(IntToStr(books[i].year))),
				'║');
		end;
	writeln(tableBot);
end.