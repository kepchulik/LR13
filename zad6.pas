program zad6;

var
  f, temp: file of real;
  x, minVal, maxVal: real;
  n, idxMin, idxMax: integer;
  count: integer;

procedure ShowFile(var f: file of real);
var
  y: real;
begin
  Reset(f);
  while not EOF(f) do
  begin
    Read(f, y);
    Write(y:8:2, ' ');
  end;
  Close(f);
  Writeln;
end;

begin
  Assign(f, 'numbers4.txt');
  Rewrite(f);

  Write('Сколько чисел записать в файл? ');
  Readln(n);

  Writeln('Введите ', n, ' вещественных чисел:');
  for var k := 1 to n do
  begin
    Read(x);
    Write(f, x);
  end;
  Close(f);

  Writeln;
  Writeln('Содержимое исходного файла:');
  Assign(f, 'numbers4.txt');
  ShowFile(f);

  Assign(f, 'numbers4.txt');
  Reset(f);

  if EOF(f) then
  begin
    Writeln('Файл пустой, обмен невозможен.');
    Close(f);
    Readln;
    Exit;
  end;

  Read(f, x);        
  minVal  := x;
  maxVal  := x;
  idxMin  := 1;
  idxMax  := 1;
  count   := 1;

  while not EOF(f) do
  begin
    Read(f, x);
    Inc(count);
    if x < minVal then
    begin
      minVal := x;
      idxMin := count;
    end;
    if x > maxVal then
    begin
      maxVal := x;
      idxMax := count;
    end;
  end;
  Close(f);
  n := count; 

  Writeln;
  Writeln('Минимальный элемент = ', minVal:0:2, ' (позиция ', idxMin, ')');
  Writeln('Максимальный элемент = ', maxVal:0:2, ' (позиция ', idxMax, ')');

  Assign(f, 'numbers4.txt');
  Reset(f);
  Assign(temp, 'temp.txt');
  Rewrite(temp);

  for var k := 1 to n do
  begin
    Read(f, x);
    if k = idxMin then
      Write(temp, maxVal)  
    else if k = idxMax then
      Write(temp, minVal) 
    else
      Write(temp, x);      
  end;

  Close(f);
  Close(temp);

  Assign(f, 'numbers4.txt');
  Rewrite(f);
  Assign(temp, 'temp.txt');
  Reset(temp);

  while not EOF(temp) do
  begin
    Read(temp, x);
    Write(f, x);
  end;

  Close(f);
  Close(temp);

  Writeln;
  Writeln('Содержимое файла после обмена min и max:');
  Assign(f, 'numbers4.txt');
  ShowFile(f);

  Readln;
end.
