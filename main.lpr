program main;

uses list,crt;

function test_0_0(): boolean;
begin
  result := true;
end;

function test_12_1(): boolean;
var
  a,b:integer;
  list1: PTList;
  p:TIterator;
  i:integer;
begin
  new(list1);
  new(p);
  list1:=create_list();
  read(a,b);
  push_front(list1,b);
  push_front(list1,a);
  p:=get_begin(list1)^.Next;
  if get_prev(p)^.Value = a then result := true
  else result := false;
end;

procedure fill_and_print_list();
var list1: PTList;
  p:TIterator;
  i:integer;
begin
  new(list1);
  new(p);
  list1:=create_list();
  push_front(list1,10);
  push_front(list1,15);
  push_front(list1,20);
  p:=get_begin(list1);

  for i:=1 to 3 do
      begin
      writeln(get_value(p));
      p:=p^.next;
      end;
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
  if test_12_1() then
    writeln('Test passed')
  else
    writeln('Test failed');
  if run_tests() then
    writeln('All tests passed')
  else
    writeln('Something wrong');
  readkey;
end.


