program main;

uses list,crt;

function test_19_create_list(): boolean;
var
  list1: PTList;
begin
  new(list1);
  list1:=create_list();
  result := (get_size(list1) = 0) and (get_begin(list1) = get_end(list1));
end;

function test_19_insert(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(get_end(list1), mass [1]);
  insert(get_end(list1), mass [2]);
  result:=(mass[2] = get_value(get_prev(get_end(list1)))) and (mass[1] = get_value(get_prev(get_prev(get_end(list1)))));
end;

function test_19_insert_after(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert_after(get_reversed_end(list1), mass [2]);
  insert_after(get_reversed_end(list1), mass [1]);
  result:=(mass[1] = get_value(get_next(get_reversed_end(list1)))) and (mass[2] = get_value(get_next(get_next(get_reversed_end(list1)))));
end;

function test_19_push_front(): boolean;
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
  result:=(mass[1] = get_value(get_next(get_reversed_end(list1)))) and (mass[2] = get_value(get_next(get_next(get_reversed_end(list1)))));
end;

function test_19_push_back(): boolean;
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
  result:=(mass[2] = get_value(get_prev(get_end(list1)))) and (mass[1] = get_value(get_prev(get_prev(get_end(list1)))));
end;

function test_19_get_size(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(get_end(list1), mass [1]);
  insert(get_end(list1), mass [2]);
  result:=get_size(list1) = 2
end;

function test_19_get_value(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
  a:integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(get_end(list1), mass [1]);
  insert(get_end(list1), mass [2]);
  a:=get_value(get_prev(get_end(list1)));
  result:=a=mass[2]
end;

function test_19_get_begin(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(get_end(list1), mass [1]);
  insert(get_end(list1), mass [2]);
  result:=get_prev(get_prev(get_end(list1))) = get_begin(list1);
end;

function test_19_get_end(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert_after(get_reversed_end(list1), mass [2]);
  insert_after(get_reversed_end(list1), mass [1]);
  result:=get_end(list1) = get_next(get_next(get_next(get_reversed_end(list1))));
end;

function test_19_get_reversed_end(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(get_end(list1), mass [1]);
  insert(get_end(list1), mass [2]);
  result:=get_reversed_end(list1) = get_prev(get_prev(get_prev(get_end(list1))));
end;

function test_19_erase(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(get_end(list1), mass [1]);
  insert(get_end(list1), mass [2]);
  result:=(get_next(get_reversed_end(list1))) = get_next(get_reversed_end(list1));
end;

function test_19_get_next(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(get_end(list1), mass [1]);
  insert(get_end(list1), mass [2]);
  result:=get_next(get_prev(get_prev(get_end(list1)))) = get_prev(get_end(list1));
end;

function test_19_get_prev(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(get_end(list1), mass [1]);
  insert(get_end(list1), mass [2]);
  result:=get_prev(get_next(get_next(get_reversed_end(list1)))) = get_next(get_reversed_end(list1));
end;

function test_19_is_end(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(get_end(list1), mass [1]);
  insert(get_end(list1), mass [2]);
  result:=is_end(get_end(list1));
end;

function test_19_is_reversed_end(): boolean;
var
  list1: PTList;
  mass:array[1..2] of integer;
begin
  new(list1);
  list1:=create_list();
  mass[1]:=5;
  mass[2]:=10;
  insert(get_end(list1), mass [1]);
  insert(get_end(list1), mass [2]);
  result:=is_reversed_end(get_reversed_end(list1));
end;

begin
  if test_19_create_list() then
    writeln('Test create_list passed')
  else
    writeln('Test create_list failed');
  if test_19_insert() then
    writeln('Test insert passed')
  else
    writeln('Test insert failed');
  if test_19_insert_after() then
    writeln('Test insert_after passed')
  else
    writeln('Test insert_after failed');
  if test_19_push_front() then
    writeln('Test push_front passed')
  else
    writeln('Test push_front failed');
  if test_19_push_back() then
    writeln('Test push_back passed')
  else
    writeln('Test push_back failed');
  if test_19_get_size() then
    writeln('Test get_size passed')
  else
    writeln('Test get_size failed');
  if test_19_get_value() then
    writeln('Test get_value passed')
  else
    writeln('Test get_value failed');
  if test_19_get_begin() then
    writeln('Test get_begin passed')
  else
    writeln('Test get_begin failed');
  if test_19_get_end() then
    writeln('Test get_end passed')
  else
    writeln('Test get_end failed');
  if test_19_get_reversed_end() then
    writeln('Test get_reversed_end passed')
  else
    writeln('Test get_reversed_end failed');
  if test_19_erase() then
    writeln('Test erase passed')
  else
    writeln('Test erase failed');
  if test_19_get_next() then
    writeln('Test get_next passed')
  else
    writeln('Test get_next failed');
  if test_19_get_prev() then
    writeln('Test get_prev passed')
  else
    writeln('Test get_prev failed');
  if test_19_is_end() then
    writeln('Test is_end passed')
  else
    writeln('Test is_end failed');
  if test_19_is_reversed_end() then
    writeln('Test is_reversed_end passed')
  else
    writeln('Test is_reversed_end failed');
  readkey;
end.


