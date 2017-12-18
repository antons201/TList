program main;

uses list;

function test_0_0(): boolean;
begin
  result := true;
end;

function test_0_1(): boolean;
begin
  writeln('-test_0_1');
  result := false;
end;

function run_tests(): boolean;
begin
  result := result and test_0_0();
end;

begin
  if run_tests() then
    writeln('All tests passed')
  else
    writeln('Something wrong');
end.

