part of 'todo_bloc.dart';

abstract class TodoEvent {}

class FetchTodo extends TodoEvent {}

class AddTodo extends TodoEvent {
  final ToDoModel todo;

  AddTodo(this.todo);
}

class UpdateTodo extends TodoEvent {
  final ToDoModel todo;

  UpdateTodo(this.todo);
}

class DeleteTodo extends TodoEvent {
  final ToDoModel todo;

  DeleteTodo(this.todo);
}