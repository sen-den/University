const
	{Максимальное количество записей, которое рассчитываем хранить}
	MaxNumberOfRecords = 4;
type
	{запись типа зачет}
	exam = record
		subject: string;
		date: string;
		mark: integer;
		end;
var
	{массив записей зачетов, три штуки (установили первой записью)}
	Cl: array [1..MaxNumberOfRecords] of exam;
	{файл для доступа к файлу}
	fl: file of exam;
	{два счетчика для циклов и переменная для главного условия программы}
	i, j, k, f: integer;

begin
f:=0; {обнуляем флаг-условие}
assign(fl, 'base.txt'); {связываем файл с переменной}
{Будем повторять это все...}
repeat
	if (f=0) then begin
		{...сначала -- красивое приглашение}
		writeln('****************');
		writeln('Select:');
		writeln('0. Show this:');
		writeln('1. Print all');
		writeln('2. Clear base');
		writeln('3. Add exam');
		writeln('4. Exit');
		writeln('9. Search day with 2+ exams');
	end;
	{******************************************************}
	{считываем что ввели}
	readln(f);
	{******************************************************}
	{если 1}
	if (f=1) then begin
		{открываем файл на чтение}
		Reset(fl);
		i:=1;
		{читаем все до конца}
		while not EOF(fl) do begin
			Read(fl, Cl[i]);
			i:= i+1;
			end;
		writeln('***');
		writeln('exams:');
		{выводим все, что там было в красивом виде}
		for j:=1 to i-1 do begin
			write(j, ' exam: ');
			write(cl[j].subject, ' ');
			write(cl[j].date, ' ');
			write(cl[j].mark, ' ');
			writeln();
			end;
		writeln();
		writeln('***');
		{и закрываем}
		close(fl);
		end;
	{******************************************************}
	{если 2, то}
	if (f=2) then begin
		Rewrite(fl);
		close(fl);
		{открываем файл на запись и закрываем его. стираем, вообщем}
		writeln('Base cleared!');
		end;
	{******************************************************}
	{если 3, то}	
	if (f=3) then begin
		Reset(fl);
		i:=1;

		{открываем файл, читаем все, что есть, за каждым разом счетчик ставим в следующую позицию}
		while not EOF(fl) do begin
			Read(fl, Cl[i]);
			i:= i+1;
			end;
		close(fl);

		{если места не осталось (уже есть MaxNumberOfRecords записей), отказываемся}
		if (i>MaxNumberOfRecords) then
			writeln('Base is full!')

		{если еще есть}
		else begin
			{читаем то, что введут}
			writeln('***');
			writeln('Adding exam:');
			write('Subject: ');			readln(Cl[i].subject);
			write('Date: ');			readln(Cl[i].date);
			write('Mark: ');			readln(Cl[i].mark);
			{стираем файл, записываем все, что есть. И последнее тоже}
			rewrite(fl);
			for j:=1 to i do begin
				write(fl, cl[j]);
				end;
			close(fl);
			
			write('***');
			end;
		end;
	{******************************************************}
	{******************************************************}
	{если 9, то}	
	if (f=9) then begin
		Reset(fl);
		i:=1;

		{открываем файл, читаем все, что есть, за каждым разом счетчик ставим в следующую позицию}
		while not EOF(fl) do begin
			Read(fl, Cl[i]);
			i:= i+1;
			end;
		close(fl);
		k:=i-1; {количество}

		for i:=1 to k-1 do
			for j:=i+1 to k do begin
				{writeln(i, j, ' ', Cl[i].date, ' ', Cl[k].date);}
				if (Cl[i].date = Cl[j].date) then
					writeln(Cl[i].date, ' you passed ', Cl[i].subject, ' and ', Cl[j].subject);
				end;
		
		end;
	{******************************************************}
{...пока не введем 4}
until (f = 4);
end.
