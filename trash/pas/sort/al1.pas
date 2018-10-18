var 
	C, s2, s1: string; 
	i,j: integer; 
	f: boolean;
begin 
	i:=1;
	write('C=');
	readln(C);
	write('s2=');
	readln(s2);
	write('s1=');
	readln(s1);
	
    s2 := concat(s2, C);
	
	while (i<length(s1)-length(C)+2) do
		begin 
			if s1[i]=C[1] then 
				begin 
					f:=true;
					for j:=1 to length(C) do
						if  s1[i+j-1]<>C[j] then 
							f:=false;
					if f=true then 
						begin 
							delete(s1,i,length(C));
							insert(s2,s1,i);
							i:=i+length(s2)-1;
						end;
				end;
			inc(i);
		end;
	writeln('S1=',s1);
end.
