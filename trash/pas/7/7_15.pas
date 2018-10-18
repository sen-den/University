Uses sysutils;
const nOfpupils = 8;
type
	pupil=record
		surname:string;
		mark:integer;
	end;
var	
	pupils:array[1..nOfpupils] of pupil;
	i:integer;
	max,min,maxI, minI:integer;

begin
	for i:=1 to nOfpupils do begin
		writeln('');
		writeln(i,' pupil:');
		write('Surname:', '':3);
		readln(pupils[i].surname);
		write('Mark:', '':6);
		readln(pupils[i].mark);
	end;

	maxI:=1; max:=pupils[maxI].mark;
	minI:=1; min:=pupils[minI].mark;

	writeln('╔═══════════╦═════╗');
	writeln('║Surname    ║Mark ║');
	for i:=1 to nOfpupils do  begin
			writeln('╠═══════════╬═════╣');
			writeln(
				'║',pupils[i].surname, '':(11-length(pupils[i].surname)),
				'║',pupils[i].mark, '':(5-length(IntToStr(pupils[i].mark))),
				'║');
			if pupils[i].mark > max then maxI:=i;
			if pupils[i].mark < min then minI:=i;
	end;
	writeln('╠═══════════╩══════╣');
	writeln('║', 'HIGEST AND LOWEST', '║');
	writeln('╠═══════════╦══════╣');
	writeln(
				'║',pupils[maxI].surname, '':(11-length(pupils[maxI].surname)),
				'║',pupils[maxI].mark, '':(5-length(IntToStr(pupils[maxI].mark))),
				'║');
	writeln('╠═══════════╬═════╣');
	writeln(
				'║',pupils[minI].surname, '':(11-length(pupils[minI].surname)),
				'║',pupils[minI].mark, '':(5-length(IntToStr(pupils[minI].mark))),
				'║');
	writeln('╚═══════════╩═════╝');
end.