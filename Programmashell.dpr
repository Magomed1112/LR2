program Programmashell;

{$APPTYPE CONSOLE}

uses
  SysUtils;

const
  P = 1000000;

type
  arr = array [1..P] of Integer;

procedure WriteMas(a: arr; n: integer);
var i: integer;
begin
  for i := 1 to n do
    write(a[i], ' ');
  writeln;
end;

procedure ShellSortIteracii(N:integer; var a:arr);
const T = 5;
var
z1, i, j, k, m: integer;
x: integer;
h: array [1 .. 5] of integer;
begin
h[1] := 31; h[2] := 15; h[3] := 7; h[4] := 3; h[5] := 1;
for m := 1 to T do
begin
k := h[m];
for i := k + 1 to N do
begin
x := a[i];
j := i-k;
while (j > k) and (x < a[j]) do
begin
a[j + k] := a[j];
j := j
-
k;
end;
if (j > k) or (x >= a[j]) then
a[j + k] := x
else
begin
a[j + k] := a[j];
a[j] := x;
for z1 := 1 to N do
write (a[z1], ' ');
writeln;
writeln;
end;
end;
end;
end;

procedure ShellSort(n:integer; var a:arr);
  const T = 5;
var
i, j, k, m: integer;
x: integer;
h: array [1 .. 5] of integer;
begin
h[1] := 31; h[2] := 15; h[3] := 7; h[4] := 3; h[5] := 1;
for m := 1 to T do
begin
k := h[m];
for i := k + 1 to N do
begin
x := a[i];
j := i
-
k;
while (j > k) and (x < a[j]) do
begin
a[j + k] := a[j];
j := j
-
k;
end;
if (j > k) or (x >= a[j]) then
a[j + k] := x
else
begin
a[j + k] := a[j];
a[j] := x;
end;
end;
end;
end;

var
  mas: arr;
  h: boolean;
  n, i: Integer ;
  f1, f2: TextFile;
  Time: TDateTime;
  TimeHour, TimeMin, TimeSec, TimeMilli: word;
  TimeSum: double;
  name1, name2: string[80];
  otvet: Char;

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
      read(f1, mas[i]);
      write('Do you want to see all iterations of sorting? Your decision: ');
      Readln(otvet);
      writeln;
    end;
      if otvet='y' then
      begin
      Writeln('Iterations: ');
      Writeln;
      Time:= Now;
      ShellSortIteracii(n, mas);
      time:=Now-Time;
      Writeln('Sorting is over and all iterations have displayed.');
      end;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
      TimeSum:= TimeMilli/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
      if otvet='n' then
      begin
      time:= Now;
      ShellSort(n, mas);
      Time:= Now-time;
      Writeln('Sorting is over.');
      end;
      DecodeTime(Time, TimeHour, TimeMin, TimeSec, TimeMilli);
      TimeSum:= TimeMilli/1000 + TimeSec + 60*TimeMin + 3600*TimeHour;
      writeln(f2, n);
      for i:= 1 to n-1 do
      write(f2, mas[i], ' ');
      writeln(f2, mas[n]);
    Write(f2, 'Шелл');
    writeln(f2);
    Writeln(f2, floattostr(TimeSum));
    Writeln;
    CloseFile(f1);
    CloseFile(f2);
    Readln;
  { TODO -oUser -cConsole Main : Insert code here }
  end;
end.
