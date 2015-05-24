program Programmquick;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  P = 1000000;

type
  arr = array [1..P] of Integer;

var
  a: arr;
  h: boolean;
  n, i: Integer ;
  f1, f2: TextFile;
  Time: TDateTime;
  TimeHour, TimeMin, TimeSec, TimeMilli: word;
  TimeSum: double;
  name1, name2: string[80];
  otvet: Char;

procedure WriteMas;
var i: integer;
begin
  for i := 1 to n do
    write(a[i], ' ');
  writeln;
  writeln;
end;

procedure sortiter(L,R: integer);
var
i,j: integer;
w,x: integer;
begin
i:=L;
j:=R;
x:=a[(L+R) div 2];
REPEAT
while a[i]<x do
i:=i+1;
while x<a[j] do
j:=j
-
1;
if i<=j then
begin
w:=a[i];
a[i]:=a[j];
a[j]:=w;
i:=i+1;
j:=j
-
1;
end;
UNTIL i>j;
WriteMas;
if L<j then
sortiter(L,j);
if i<R then
sortiter(i,R);
end;
procedure QuickSortIteracii;
begin
sortiter(1,N);
end
;
procedure sort(L,R: integer);
var
i,j: integer;
w,x: integer;
begin
i:=L;
j:=R;
x:=a[(L+R) div 2];
REPEAT
while a[i]<x do
i:=i+1;
while x<a[j] do
j:=j
-
1;
if i<=j then
begin
w:=a[i];
a[i]:=a[j];
a[j]:=w;
i:=i+1;
j:=j
-
1;
end;
UNTIL i>j;
if L<j then
sort(L,j);
if i<R then
sort(i,R);
end;
procedure QuickSort;
begin
sort(1,N);
end
;

begin
  begin
    write('Please, enter the name of input file: ');
    Readln(name1);
    AssignFile(f1,name1);
    {$I-}
    Reset(f1);
    {$I+};
    If ioresult=2 then
    begin
    Writeln('Sorry, but you file not found...');
    readln;
    end
    else
    begin
      write('Please, enter the name of output file: ');
      readln(name2);
      AssignFile(f2, name2);
      Rewrite(f2);
      read(f1, n);
      for i:= 1 to n do
      read(f1, a[i]);
      write('Do you want to see all iterations of sorting? Your decision: ');
      Readln(otvet);
      writeln;
    end;
      if otvet='y' then
      begin
      Writeln('Iterations: ');
      Writeln;
      Time:= Now;
      QuickSortIteracii;
      time:=Now-Time;
      Writeln('Sorting is over and all iterations have displayed.');
      end;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
      TimeSum:= TimeMilli/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
      if otvet='n' then
      begin
      time:= Now;
      QuickSort;
      Time:= Now-time;
      Writeln('Sorting is over.');
      end;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
      TimeSum:= TimeMilli/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
      writeln(f2, n);
      for i:= 1 to n-1 do
      write(f2, a[i], ' ');
      writeln(f2, a[n]);
    Write(f2, 'ֱûסענאÿ');
    writeln(f2);
    Writeln(f2, floattostr(TimeSum));
    Writeln;
    CloseFile(f1);
    CloseFile(f2);
    Readln;
  { TODO -oUser -cConsole Main : Insert code here }
  end;
end.
