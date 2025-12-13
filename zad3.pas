program zad3;

var
  f, fOdd, fEven: file of real;
  x: real;
  i, n: integer;

procedure ShowFile(var f: file of real);
begin
  Reset(f);
  while not EOF(f) do
  begin
    Read(f, x);
    Write(x:8:2, ' ');
  end;
  Close(f);
  Writeln;
end;

begin
  Assign(f, 'numbers.txt');
  Rewrite(f);

  Write('Сколько чисел записать в файл? ');  
  Readln(n);

  Writeln('Введите ', n, ' вещественных чисел:');
  for i := 1 to n do
  begin
    Read(x);
    Write(f, x);
  end;
  Close(f);

  Assign(f, 'numbers.txt');
  Reset(f);

  Assign(fOdd,  'odd.txt');   Rewrite(fOdd);
  Assign(fEven, 'even.txt');  Rewrite(fEven);

  i := 0;
  while not EOF(f) do
  begin
    Read(f, x);
    Inc(i);
    if Odd(i) then
      Write(fOdd, x)   { 1,3,5,... }
    else
      Write(fEven, x); { 2,4,6,... }
  end;

  Close(f);
  Close(fOdd);
  Close(fEven);

  Writeln;
  Writeln('Содержимое исходного файла:');
  Assign(f, 'numbers.txt');
  ShowFile(f);

  Writeln('Содержимое файла с НЕЧЁТНЫМИ номерами:');
  Assign(fOdd, 'odd.txt');
  ShowFile(fOdd);

  Writeln('Содержимое файла с ЧЁТНЫМИ номерами:');
  Assign(fEven, 'even.txt');
  ShowFile(fEven);

  Readln;
end.
