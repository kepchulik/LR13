program zad5;

var
  f: file of real;
  x: real;
  n: integer;
  a: array of real;
  lastLocalMax: real;
  lastIndex: integer;

begin
  Assign(f, 'numbers3.txt');
  Rewrite(f);

  Write('Сколько чисел записать в файл? ');
  Readln(n);

  Writeln('Введите ', n, ' вещественных чисел:');
  for var i := 1 to n do
  begin
    Read(x);
    Write(f, x);
  end;
  Close(f);

  Reset(f);
  SetLength(a, n);

  for var i := 0 to n - 1 do
  begin
    Read(f, x);
    a[i] := x;
  end;
  Close(f);

  Writeln;
  Writeln('Считанные числа:');
  for var i := 0 to n - 1 do
    Write(a[i]:8:2, ' ');
  Writeln;

  lastIndex := -1;

  if n >= 3 then
  begin
    for var i := 1 to n - 2 do
      if (a[i] > a[i - 1]) and (a[i] > a[i + 1]) then
        lastIndex := i;
    Writeln;
    if lastIndex <> -1 then
    begin
      lastLocalMax := a[lastIndex];
      Writeln('Последний локальный максимум = ', lastLocalMax:0:2);
      Writeln('Его номер (позиция) = ', lastIndex + 1);
    end
    else
      Writeln('Локальных максимумов нет.');
  end
  else
  begin
    Writeln;
    Writeln('Локальных максимумов нет (в массиве меньше трёх элементов).');
  end;

  Readln;
end.
