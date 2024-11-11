part of 'todo_bloc.dart';

abstract class TodoEvent {}

class GetTodo extends TodoEvent {}

class AddTodo extends TodoEvent {
  final ToDoModel todo;

  AddTodo(this.todo);
}

class UpdateTodo extends TodoEvent {
  final ToDoModel todo;
  final ToDoModel oldTodo;

  UpdateTodo(this.todo, this.oldTodo);
}

class DeleteTodo extends TodoEvent {
  final ToDoModel todo;

  DeleteTodo(this.todo);
}