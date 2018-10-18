Uses sysutils;
const nOfExams = 3;
type
	exam=record
		semN:integer;
		subject:string;
		examenator:string;
		mark:integer;
	end;
var	
	exams:array[1..nOfexams] of exam;
	i:integer;
	sum, count:integer;
	find:integer;

begin
	for i:=1 to nOfexams do begin
		writeln('');
		writeln(i,' exam:');
		write('Semestr:', '':4);
		readln(exams[i].semN);
		write('Subject:', '':4);
		readln(exams[i].subject);
		write('Examenator:', '':1);
		readln(exams[i].examenator);
		write('Mark:', '':7);
		readln(exams[i].mark);
	end;

	writeln('');
	write('Semestr for search: ');
	readln(find);
	sum:=0; count:=0;

	writeln('╔═══════════════╦═══════════╦══════╗');
	writeln('║Subject        ║Examenator ║Mark  ║');
	for i:=1 to nOfexams do
		if (exams[i].semN=find) then begin
			writeln('╠═══════════════╬═══════════╬══════╣');
			writeln(
				'║',exams[i].subject, '':(15-length(exams[i].subject)),
				'║',exams[i].examenator, '':(11-length(exams[i].examenator)),
				'║',exams[i].mark, '':(6-length(IntToStr(exams[i].mark))),
				'║');
			sum:= sum + exams[i].mark;
			count:= count + 1;
			end;
	writeln('╠═══════════════╬═══════════╬══════╣');
	writeln('║', 'AVERAGE', '':8, '║', '':11, '║', sum/count:6:2, '║');
	writeln('╚═══════════════╩═══════════╩══════╝');
end.