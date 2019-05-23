unit Modul10;
interface
const
    n=5;
type
    Arr = array [1..n] of real;

function getMinElementNumber(A:Arr):integer;
function mulNegRangeElements(A:Arr):real;
         
  
implementation

    function getMinElementNumber(A:Arr):integer;
        var
            i, minI: integer;
            min: real;
        begin
            minI := 1;
            min := A[minI];
            for i := 1 to n do
                if (A[i] < min) then begin
                    minI:=i;
                    min:=A[i];
                    end;
            getMinElementNumber:=minI;
        end;

    function mulNegRangeElements(A:Arr):real;
        var
            i, firstNegI,secondNegI:integer;
            multiplication: real;
        begin
            firstNegI:=1;
            while (A[firstNegI] >= 0) do
                firstNegI:=firstNegI + 1;
            
            secondNegI:=firstNegI + 1;
            while (A[secondNegI] >= 0) do
                secondNegI:=secondNegI + 1;

            multiplication:=1;
            for i:= firstNegI+1 to secondNegI-1 do
                multiplication:=multiplication*A[i];

            mulNegRangeElements:=multiplication;
        end;

end.