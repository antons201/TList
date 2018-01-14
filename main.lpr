program main;

uses list,crt;

function test_create_list(): boolean;
var
  list1: PTList;
begin
  new(list1);
  list1:=create_list();
  if (list1^.head^.next =list1^.tail) and (list1^.tail^.prev =list1^.head) then
    result:=true
  else
    result:=false;
end;

function test_insert(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(list1^.tail, mass [1]);
  insert(list1^.tail, mass [2]);
  if (mass[2] = list1^.tail^.prev^.value) and (mass[1] = list1^.tail^.prev^.prev^.value) then
    result:=true
  else
    result:=false;
end;

function test_insert_after(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert_after(list1^.head, mass [2]);
  insert_after(list1^.head, mass [1]);
  if (mass[1] = list1^.head^.next^.value) and (mass[2] = list1^.head^.next^.next^.value) then
    result:=true
  else
    result:=false;
end;

function test_push_front(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  push_front(list1, mass[2]);
  push_front(list1, mass[1]);
  if (mass[1] = list1^.head^.next^.value) and (mass[2] = list1^.head^.next^.next^.value) then
    result:=true
  else
    result:=false;
end;

function test_push_back(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  push_back(list1, mass[1]);
  push_back(list1, mass[2]);
  if (mass[2] = list1^.tail^.prev^.value) and (mass[1] = list1^.tail^.prev^.prev^.value) then
    result:=true
  else
    result:=false;
end;

function test_get_size(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(list1^.tail, mass [1]);
  insert(list1^.tail, mass [2]);
  if get_size(list1) = 2 then
    result:=true
  else
    result:=false;
end;

function test_get_value(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
  a:integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(list1^.tail, mass [1]);
  insert(list1^.tail, mass [2]);
  a:=get_value(list1^.tail^.prev);
  if a=mass[2] then
    result:=true
  else
    result:=false;
end;

function test_get_begin(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(list1^.tail, mass [1]);
  insert(list1^.tail, mass [2]);
  if get_begin(list1) = list1^.head^.next then
    result:=true
  else
    result:=false;
end;

function test_get_end(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(list1^.tail, mass [1]);
  insert(list1^.tail, mass [2]);
  if get_end(list1) = list1^.tail then
    result:=true
  else
    result:=false;
end;

function test_get_reversed_end(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(list1^.tail, mass [1]);
  insert(list1^.tail, mass [2]);
  if get_reversed_end(list1) = list1^.head then
    result:=true
  else
    result:=false;
end;

function test_erase(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(list1^.tail, mass [1]);
  insert(list1^.tail, mass [2]);
  if erase(list1^.head^.next) = list1^.head^.next then
    result:=true
  else
    result:=false;
end;

function test_get_next(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(list1^.tail, mass [1]);
  insert(list1^.tail, mass [2]);
  if get_next(list1^.head^.next) = list1^.head^.next^.next then
    result:=true
  else
    result:=false;
end;

function test_get_prev(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(list1^.tail, mass [1]);
  insert(list1^.tail, mass [2]);
  if get_prev(list1^.head^.next^.next) = list1^.head^.next then
    result:=true
  else
    result:=false;
end;

function test_is_end(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(list1^.tail, mass [1]);
  insert(list1^.tail, mass [2]);
  if is_end(list1^.tail) then
    result:=true
  else
    result:=false;
end;

function test_is_reversed_end(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(list1^.tail, mass [1]);
  insert(list1^.tail, mass [2]);
  if is_reversed_end(list1^.head) then
    result:=true
  else
    result:=false;
end;

begin
  if test_create_list() then
    writeln('Test create_list passed')
  else
    writeln('Test create_list failed');
  if test_insert() then
    writeln('Test insert passed')
  else
    writeln('Test insert failed');
  if test_insert_after() then
    writeln('Test insert_after passed')
  else
    writeln('Test insert_after failed');
  if test_push_front() then
    writeln('Test push_front passed')
  else
    writeln('Test push_front failed');
  if test_push_back() then
    writeln('Test push_back passed')
  else
    writeln('Test push_back failed');
  if test_get_size() then
    writeln('Test get_size passed')
  else
    writeln('Test get_size failed');
  if test_get_value() then
    writeln('Test get_value passed')
  else
    writeln('Test get_value failed');
  if test_get_begin() then
    writeln('Test get_begin passed')
  else
    writeln('Test get_begin failed');
  if test_get_end() then
    writeln('Test get_end passed')
  else
    writeln('Test get_end failed');
  if test_get_reversed_end() then
    writeln('Test get_reversed_end passed')
  else
    writeln('Test get_reversed_end failed');
  if test_erase() then
    writeln('Test erase passed')
  else
    writeln('Test erase failed');
  if test_get_next() then
    writeln('Test get_next passed')
  else
    writeln('Test get_next failed');
  if test_get_prev() then
    writeln('Test get_prev passed')
  else
    writeln('Test get_prev failed');
  if test_is_end() then
    writeln('Test is_end passed')
  else
    writeln('Test is_end failed');
  if test_is_reversed_end() then
    writeln('Test is_reversed_end passed')
  else
    writeln('Test is_reversed_end failed');
  readkey;
end.


