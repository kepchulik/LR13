program zad1;

var
  f_in, f_out: text;
  s: string;
  i: integer;
  lastSpace: integer;

begin
  assign(f_in, 'input.txt');
  reset(f_in);

  readln(f_in, s);
  close(f_in);

  writeln('Исходная строка:');
  writeln(s);

  lastSpace := 0;
  for i := 1 to length(s) do
    if s[i] = ' ' then
      lastSpace := i;

  if lastSpace > 0 then
    s := copy(s, 1, lastSpace - 1);

  writeln;
  writeln('Результат:');
  writeln(s);

  assign(f_out, 'output.txt');
  rewrite(f_out);
  writeln(f_out, s);
  close(f_out);
end.
