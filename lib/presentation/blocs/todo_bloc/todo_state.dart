part of 'todo_bloc.dart';

enum TodoStatus { initial, loading, loaded, error }

final class TodoState extends Equatable {
  final List<ToDoModel> todoList;
  final TodoStatus status;

  const TodoState({
    this.status = TodoStatus.initial,
    this.todoList = const [],
  });

  TodoState copyWith({
    List<ToDoModel>? todoList,
    TodoStatus? status,
  }) {
    return TodoState(
      todoList: todoList ?? this.todoList,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [todoList, status];
}
