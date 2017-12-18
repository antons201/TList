unit list;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TValue = integer;

  PTlist = ^Tlist;
  TIterator = ^TNode;

  TNode = record
    value: TValue;
    prev, next: TIterator;
    owner: PTlist;
  end;

  TList = record
    head, tail: TIterator;
    size: integer;
  end;

// Создает пустой список
//function create_list(): PTList;

// Вставляет новый элемент после указанного
//procedure insert(iterator: TIterator; value: TValue);

// Вставляет новый элемент перед указанным
//procedure insert(iterator: TIterator; value: TValue);

// Вставляет новый элемент в начало списка
//procedure push_front(list: PTList; value: TValue);

// Вставляет новый элемент в конец списка
//procedure push_back(list: PTList; value: TValue);

// Возвращает количество элементов в списке
//function get_size(list: PTList): integer;

// Возвращает значение элемента, на который указывает итератор
//function get_value(iterator: TIterator): TValue;

// Возвращает указатель на первый элемент списка
// или get_end() если список пуст
//function get_begin(list: PTList): TIterator;

// Возвращает указатель на элемент, следующий за последним
//function get_end(list: PTList): TIterator;

// Возвращает указатель на элемент, предшествующий первому
//function get_reversed_end(list: PTList): TIterator;

// Удаляет из списка элемент, на который указывает итератор.
// Возвращает указатель на следующий за ним
//function erase(iterator: TIterator): TIterator;

// Возвращает указатель на следующий элемент
//function get_next(iterator: TIterator): TIterator;

// Возвращает указатель на предыдущий элемент
//function get_prev(iterator: TIterator): TIterator;

// Проверяет, указывает ли итератор на элемент, следующий за последним
//function is_end(iterator: TIterator): boolean;

// Проверяет, указывает ли итератор на элемент, предшествующий первому
//function is_reversed_end(iterator: TIterator): boolean;

implementation



end.

