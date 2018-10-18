Uses sysutils;
const 
	nOfProducts = 2; {predefined number of products be used enywhere farther}
	tableTop = '╔══════════╦════════╦════════╗';
	tableMid = '╠══════════╬════════╬════════╣';
	tableBot = '╚══════════╩════════╩════════╝';
type
	product=record
		title:string;
		amount:integer;
		price:integer;
	end;
var	
	products:array[1..nOfproducts] of product;
	i,sum:integer;
	find:string;
begin
	{Filling array of products}
	for i:=1 to nOfproducts do begin 
		writeln('');
		writeln(i,' product:');
		write('Title:', '':5);
		readln(products[i].title);
		write('Amount:', '':4);
		readln(products[i].amount);
		write('Price:', '':5);
		readln(products[i].price);
	end;

	writeln('');
	write('Product title for edit: ');readln(find);
	for i:=1 to nOfProducts do
		if products[i].title = find then begin
			writeln(products[i].title, ' was found.');
			Write('New amount: '); readln(products[i].amount);
			Write('New price: '); readln(products[i].price);
			break;
		end else
			writeln(products[i].title, ' was not found.');

	sum:=0;
	{Output all as table}
	writeln(tableTop);
	writeln('║Title     ║Amount  ║Price   ║');
	for i:=1 to nOfproducts do
		begin
			writeln(tableMid);
			writeln(
				'║', products[i].title, '':(10-length(products[i].title)),
				'║', products[i].amount, '':(8-length(IntToStr(products[i].amount))),
				'║', products[i].price, '':(8-length(IntToStr(products[i].price))),
				'║');
			sum:=sum + products[i].amount*products[i].price; {calculating all products sum}
		end;
	writeln(tableMid);
	writeln('║', 'TOTAL', '':5, '║', '':8, '║', sum, '':5, '║');
	writeln(tableBot);
end.