program zad7;

var
  f: file of char;
  c: char;
  s: string;
  i: integer;

begin
  Assign(f, 'text.txt');
  Rewrite(f);

  Writeln('Введите строку для записи в файл:');
  Readln(s);

  for i := 1 to Length(s) do
    Write(f, s[i]);

  Close(f);

  Assign(f, 'text.txt');
  Reset(f);

  for i := 0 to FileSize(f) - 1 do
  begin
    Seek(f, i);
    Read(f, c);

    if ((i + 1) mod 2 = 0) then
    begin
      c := '!';                 
      Seek(f, i);               
      Write(f, c);             
    end;
  end;

  Close(f);

  Assign(f, 'text.txt');
  Reset(f);

  Writeln;
  Writeln('Содержимое файла после замены:');
  while not EOF(f) do
  begin
    Read(f, c);
    Write(c);
  end;
  Writeln;

  Close(f);
  Readln;
end.
