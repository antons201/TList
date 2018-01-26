program main;

uses list,crt;

function test_1_19_create_list(): boolean;
var
  list1: PTList;
begin
  list1:=create_list();
  result := (get_size(list1) = 0) and (get_begin(list1) = get_end(list1));
end;

function test_2_19_insert(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  q:TIterator;
  i,k:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert(get_end(list1), mass [i]);
  end;
  q:=get_begin(list1);
  k:=0;
  for i:= 1 to 1000000 do
  if get_value(q) = mass[i] then
    begin
  q:=get_next(q);
  k:=k+1;
    end;
  result:=k=1000000;
end;

function test_3_19_insert_after(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  q:TIterator;
  i,k:integer;
begin
  list1:=create_list();
 for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert_after(get_reversed_end(list1), mass [i]);
  end;
  q:=get_begin(list1);
  k:=0;
  for i:= 1000000 downto 1 do
  if get_value(q) = mass[i] then
    begin
  q:=get_next(q);
  k:=k+1;
    end;
  result:=k=1000000;
end;

function test_4_19_push_front(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  q:TIterator;
  i,k:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  push_front(list1, mass[i]);
  end;
  q:=get_begin(list1);
  k:=0;
  for i:= 1000000 downto 1 do
  if get_value(q) = mass[i] then
    begin
  q:=get_next(q);
  k:=k+1;
    end;
  result:=k=1000000;
end;

function test_5_19_push_back(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  q:TIterator;
  i,k:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  push_back(list1, mass[i]);
  end;
  q:=get_begin(list1);
  k:=0;
  for i:= 1 to 1000000 do
  if get_value(q) = mass[i] then
    begin
  q:=get_next(q);
  k:=k+1;
    end;
  result:=k=1000000;
end;

function test_6_19_get_size(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  i:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert(get_end(list1), mass [i]);
  end;
  result:=get_size(list1) = 1000000
end;

function test_7_19_get_value(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  q:TIterator;
  i,k:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert(get_end(list1), mass [i]);
  end;
  q:=get_begin(list1);
  k:=0;
  for i:= 1 to 1000000 do
  if get_value(q) = mass[i] then
    begin
  q:=get_next(q);
  k:=k+1;
    end;
  result:=k=1000000;
end;

function test_8_19_get_begin(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  i:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert(get_end(list1), mass [i]);
  end;
  result:=get_next(get_reversed_end(list1)) = get_begin(list1);
end;

function test_9_19_get_end(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  i:integer;
  q:TIterator;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert_after(get_reversed_end(list1), mass [i]);
  end;
  q:=get_begin(list1);
  for i:= 1 to 1000000 do
  q:=get_next(q);
  result:=q = get_end(list1);
end;

function test_10_19_get_reversed_end(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  i:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert(get_end(list1), mass [i]);
  end;
  result:=get_reversed_end(list1) = get_prev(get_begin(list1));
end;

function test_11_19_erase(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  i:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert(get_end(list1), mass [i]);
  end;
  result:=(erase(get_begin(list1)) = get_begin(list1))and(get_size(list1) = 999999);
end;

function test_12_19_get_next(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  i:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert(get_end(list1), mass [i]);
  end;
  result:=get_next(get_prev(get_prev(get_end(list1)))) = get_prev(get_end(list1));
end;

function test_13_19_get_prev(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  i:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert(get_end(list1), mass [i]);
  end;
  result:=get_prev(get_next(get_next(get_reversed_end(list1)))) = get_next(get_reversed_end(list1));
end;

function test_14_19_is_end(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  i:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert(get_end(list1), mass [i]);
  end;
  result:=is_end(get_end(list1));
end;

function test_15_19_is_reversed_end(): boolean;
var
  list1: PTList;
  mass:array[1..1000000] of integer;
  i:integer;
begin
  list1:=create_list();
  for i:= 1 to 1000000 do
  begin
  mass[i]:=i;
  insert(get_end(list1), mass [i]);
  end;
  result:=is_reversed_end(get_reversed_end(list1));
end;

begin
  if test_1_19_create_list() then
    writeln('Test create_list passed')
  else
    writeln('Test create_list failed');
  if test_2_19_insert() then
    writeln('Test insert passed')
  else
    writeln('Test insert failed');
  if test_3_19_insert_after() then
    writeln('Test insert_after passed')
  else
    writeln('Test insert_after failed');
  if test_4_19_push_front() then
    writeln('Test push_front passed')
  else
    writeln('Test push_front failed');
  if test_5_19_push_back() then
    writeln('Test push_back passed')
  else
    writeln('Test push_back failed');
  if test_6_19_get_size() then
    writeln('Test get_size passed')
  else
    writeln('Test get_size failed');
  if test_7_19_get_value() then
    writeln('Test get_value passed')
  else
    writeln('Test get_value failed');
  if test_8_19_get_begin() then
    writeln('Test get_begin passed')
  else
    writeln('Test get_begin failed');
  if test_9_19_get_end() then
    writeln('Test get_end passed')
  else
    writeln('Test get_end failed');
  if test_10_19_get_reversed_end() then
    writeln('Test get_reversed_end passed')
  else
    writeln('Test get_reversed_end failed');
  if test_11_19_erase() then
    writeln('Test erase passed')
  else
    writeln('Test erase failed');
  if test_12_19_get_next() then
    writeln('Test get_next passed')
  else
    writeln('Test get_next failed');
  if test_13_19_get_prev() then
    writeln('Test get_prev passed')
  else
    writeln('Test get_prev failed');
  if test_14_19_is_end() then
    writeln('Test is_end passed')
  else
    writeln('Test is_end failed');
  if test_15_19_is_reversed_end() then
    writeln('Test is_reversed_end passed')
  else
    writeln('Test is_reversed_end failed');
  readkey;
end.


