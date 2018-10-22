const nOfTrains = 3; {Сколько бкдет зеписей}
type
	Train=record {Структура записи из условия}
		number:integer;
		st_priznach:string;
		time_otprav:string;
		time_v_pyti:string;
	end;
var	
	Trains:array[1..nOfTrains] of Train;
	i:integer;
	find_punkt:string; {То, по чему будем искать}
	find_numbr:integer;

begin {Вводим все}
	for i:=1 to nOfTrains do begin
		writeln('');
		writeln(i,' Train:');
		write('Number:', '':18);
		readln(Trains[i].number);
		write('Stanzia priznachenya:', '':4);
		readln(Trains[i].st_priznach);
		write('Time otpravki:', '':11);
		readln(Trains[i].time_otprav);
		write('Time v pyti:', '':13);
		readln(Trains[i].time_v_pyti);
	end;

	{То, по чему будем искать}
	writeln('');
	write('Number for search: ');
	readln(find_numbr);
	write('Punkt for search: ');
	readln(find_punkt);

	{Выводим все, что нашли}
	for i:=1 to nOfTrains do begin
		if (Trains[i].number=find_numbr) then
			writeln(Trains[i].number, ' GOES TO ', Trains[i].st_priznach);
		if (Trains[i].st_priznach=find_punkt) then
			writeln(Trains[i].number, ' GOES TO ', Trains[i].st_priznach);
		end;
end.