program zad2;

var
  f_in, f_out: text;
  s: array[1..100] of string;
  n, i: integer;
  maxLen: integer;

begin
  assign(f_in, 'input.txt');
  reset(f_in);

  n := 0;
  while not eof(f_in) do
  begin
    n := n + 1;
    readln(f_in, s[n]);
  end;
  close(f_in);

  writeln('Считанные строки:');
  for i := 1 to n do
    writeln(s[i]);

  maxLen := 0;
  for i := 1 to n do
    if length(s[i]) > maxLen then
      maxLen := length(s[i]);

  writeln;
  writeln('Максимальная длина строки = ', maxLen);
  writeln('Строки наибольшей длины (в обратном порядке):');

  assign(f_out, 'output.txt');
  rewrite(f_out);

  for i := n downto 1 do
    if length(s[i]) = maxLen then
    begin
      writeln(s[i]);       
      writeln(f_out, s[i]); 
    end;

  close(f_out);
end.
