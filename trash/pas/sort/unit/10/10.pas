uses Modul10;

var
    i:integer;
    Numbers: Arr;
Begin
    writeln('Input Numbers');
    for i:=1 to n do
        readln(Numbers[i]);

    writeln('Number of minimal element is ', getMinElementNumber(Numbers));

    writeln('Multiplication of elements between two first negative elements: ', mulNegRangeElements(Numbers));

End.