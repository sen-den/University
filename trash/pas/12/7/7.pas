uses Modul7;

var
    i:integer;
    Numbers: Arr;
Begin
    writeln('Input Numbers');
    for i:=1 to n do
        readln(Numbers[i]);

    writeln('Count of negative elements is ', getCountOfNegativeElements(Numbers));

    writeln('Sum of elements after abs smallest: ', sumOfElementsAfterAbsMin(Numbers));

End.
