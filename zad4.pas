program zad4;

var
  f: file of real;
  x: real;
  i, n: integer;
  sumEven: real;

begin
  Assign(f, 'numbers2.txt');
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

  Assign(f, 'numbers2.txt');
  Reset(f);

  sumEven := 0;
  i := 0;

  Writeln;
  Writeln('Содержимое файла:');
  while not EOF(f) do
  begin
    Read(f, x);
    Inc(i);
    Write(x:8:2, ' ');   

    if (i mod 2 = 0) then
      sumEven := sumEven + x;
  end;
  Close(f);

  Writeln;
  Writeln('Сумма элементов с чётными номерами = ', sumEven:0:2);
  Readln;
end.
