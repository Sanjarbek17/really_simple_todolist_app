import 'package:really_simple_todolist_app/data/models/todo_model.dart';
import 'package:really_simple_todolist_app/data/services/todo_service.dart';

class TodoRepository {
  final TodoService _todoService;

  TodoRepository({required TodoService todoService}) : _todoService = todoService;

  Stream<List<ToDoModel>> getTodos() => _todoService.getTodos();

  Future<void> add(ToDoModel todo) async {
    _todoService.add(todo);
  }

  Future<void> update(ToDoModel todo, ToDoModel oldTodo) async {
    _todoService.update(todo, oldTodo);
  }

  Future<void> delete(ToDoModel todo) async {
    _todoService.delete(todo);
  }
}
