unit Modul7;
interface
const
    n=5;
type
    Arr = array [1..n] of real;

function getCountOfNegativeElements(A:Arr):integer;
function sumOfElementsAfterAbsMin(A:Arr):real;
         
  
implementation

    function getCountOfNegativeElements(A:Arr):integer;
        var
            i, count: integer;
        begin
            count:=0;
            for i := 1 to n do
                if (A[i] < 0) then 
                    count:=count+1;
            getCountOfNegativeElements:=count;
        end;

    function sumOfElementsAfterAbsMin(A:Arr):real;
        var
            i, minI:integer;
            sum, min: real;
        begin
            minI:=1;
            min:=A[minI];
            for i:=1 to n do
                if(abs(A[i]) < min) then begin
                    minI := i;
                    min := abs(A[i]);
                    end;
            sum:=0;
            for i:=minI + 1 to n do
                sum:=sum + A[i];

            sumOfElementsAfterAbsMin:=sum;
        end;

end.
