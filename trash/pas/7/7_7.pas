Uses sysutils;
const nOfWorkers = 2;
type
	worker=record
		surname:string;
		b_year:integer;
		stag:integer;
		oklad:integer;
	end;
var	
	workers:array[1..nOfWorkers] of worker;
	i:integer;
	find:string;

begin
	for i:=1 to nOfWorkers do begin
		writeln('');
		writeln(i,' worker:');
		write('Surname:', '':8);
		readln(workers[i].surname);
		write('Year of birth:', '':2);
		readln(workers[i].b_year);
		write('Stag:', '':11);
		readln(workers[i].stag);
		write('Oklad:', '':10);
		readln(workers[i].oklad);
	end;

	writeln('');
	write('Surname for search: ');
	readln(find);

	writeln('╔═══════════════╦═════╗');
	writeln('║Surname        ║Stag ║');
	for i:=1 to nOfWorkers do
		if (workers[i].surname=find) then begin
			writeln('╠═══════════════╬═════╣');
			writeln(
				'║',workers[i].surname, '':(15-length(workers[i].surname)),
				'║', workers[i].stag, '':(5-length(IntToStr(workers[i].stag))),
				'║');
			end;
	writeln('╚═══════════════╩═════╝');
end.