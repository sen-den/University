var
    S: string;
    i, c: integer;
    w: boolean;
BEGIN
    write('Слово: ');
    readln(S);
    writeln(S);

    w := true; { New word hasn't counted as word with A yet }
    c := 0; { count of words }
    for i:=1 to length(S) do
        begin
            if (w and (S[i] = 'a')) then { NON cyrilic A }
                    begin
                        c := c + 1;
                        w := false; { this ward has alredy counted }
                    end;
                
            if S[i] = ' ' then
                w := true; { prewious word finished, looking for A again }
        end;

    writeln(c);
END.
