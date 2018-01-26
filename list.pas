unit list;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TValue = integer;

  PTlist = ^TList;
  TIterator = ^TNode;

  TNode = record
    Value: TValue;
    prev, Next: TIterator;
    owner: PTlist;
  end;

  TList = record
    head, tail: TIterator;
    size: integer;
  end;

// Создает пустой список
function create_list(): PTList;

// Вставляет новый элемент перед указанным
procedure insert(iterator: TIterator; Value: TValue);

// Вставляет новый элемент после указанного
procedure insert_after(iterator: TIterator; Value: TValue);

// Вставляет новый элемент в начало списка
procedure push_front(list: PTList; Value: TValue);

// Вставляет новый элемент в конец списка
procedure push_back(list: PTList; Value: TValue);

// Возвращает количество элементов в списке
function get_size(list: PTList): integer;

// Возвращает значение элемента, на который указывает итератор
function get_value(iterator: TIterator): TValue;

// Возвращает указатель на первый элемент списка
// или get_end() если список пуст
function get_begin(list: PTList): TIterator;

// Возвращает указатель на элемент, следующий за последним
function get_end(list: PTList): TIterator;

// Возвращает указатель на элемент, предшествующий первому
function get_reversed_end(list: PTList): TIterator;

// Удаляет из списка элемент, на который указывает итератор.
// Возвращает указатель на следующий за ним
function erase(iterator: TIterator): TIterator;

// Возвращает указатель на следующий элемент
function get_next(iterator: TIterator): TIterator;

// Возвращает указатель на предыдущий элемент
function get_prev(iterator: TIterator): TIterator;

// Проверяет, указывает ли итератор на элемент, следующий за последним
function is_end(iterator: TIterator): boolean;

// Проверяет, указывает ли итератор на элемент, предшествующий первому
function is_reversed_end(iterator: TIterator): boolean;

implementation

function create_list(): PTList;
begin
  new(Result);
  new(Result^.head);
  new(Result^.tail);
  Result^.head^.Next := Result^.tail;
  Result^.head^.prev := nil;
  Result^.tail^.prev := Result^.head;
  Result^.tail^.Next := nil;
  Result^.head^.owner := Result;
  Result^.tail^.owner := Result;
  Result^.size := 0;
end;

procedure insert(iterator: TIterator; Value: TValue);
var
  p: TIterator;
begin
  new(p);
  p^.prev := iterator^.prev;
  p^.Next := iterator;
  p^.Value := Value;
  iterator^.prev^.Next := p;
  iterator^.prev := p;
  p^.owner := iterator^.owner;
  Inc(iterator^.owner^.size);
  p^.owner := iterator^.owner;
end;

procedure insert_after(iterator: TIterator; Value: TValue);
var
  p: TIterator;
begin
  new(p);
  p^.prev := iterator;
  p^.Next := iterator^.Next;
  p^.Value := Value;
  iterator^.Next^.prev := p;
  iterator^.Next := p;
  Inc(iterator^.owner^.size);
  p^.owner := iterator^.owner;
end;

procedure push_front(list: PTList; Value: TValue);
var
  p: TIterator;
begin
  new(p);
  list^.head^.prev := nil;
  p^.prev := list^.head;
  p^.Next := list^.head^.Next;
  p^.Value := Value;
  list^.head^.Next^.prev := p;
  list^.head^.Next := p;
  Inc(list^.size);
end;

procedure push_back(list: PTList; Value: TValue);
var
  p: TIterator;
begin
  new(p);
  list^.tail^.Next := nil;
  p^.prev := list^.tail^.prev;
  p^.Next := list^.tail;
  p^.Value := Value;
  list^.tail^.prev^.Next := p;
  list^.tail^.prev := p;
  Inc(list^.size);
end;

function get_size(list: PTList): integer;
begin
  Result := list^.size;
end;

function get_value(iterator: TIterator): TValue;
begin
  Result := iterator^.Value;
end;

function get_begin(list: PTList): TIterator;
begin
  if list^.size > 0 then
    Result := list^.head^.Next
  else
    Result := get_end(list);
end;

function get_end(list: PTList): TIterator;
begin
  Result := list^.tail;
end;

function get_reversed_end(list: PTList): TIterator;
begin
  Result := list^.head;
end;

function erase(iterator: TIterator): TIterator;
begin
  iterator^.prev^.Next := iterator^.Next;
  iterator^.Next^.prev := iterator^.prev;
  Result := iterator^.Next;
  dispose(iterator);
  iterator^.owner^.size := iterator^.owner^.size - 1;
end;

function get_next(iterator: TIterator): TIterator;
begin
  Result := iterator^.Next;
end;

function get_prev(iterator: TIterator): TIterator;
begin
  Result := iterator^.prev;
end;

function is_end(iterator: TIterator): boolean;
begin
  if iterator = iterator^.owner^.tail then
    Result := True
  else
    Result := False;
end;

function is_reversed_end(iterator: TIterator): boolean;
begin
  if iterator = iterator^.owner^.head then
    Result := True
  else
    Result := False;
end;

end.
