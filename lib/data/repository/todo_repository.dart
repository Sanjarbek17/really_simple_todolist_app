import 'package:really_simple_todolist_app/data/models/todo_model.dart';
import 'package:really_simple_todolist_app/data/services/todo_service.dart';

class TodoRepository {
  final TodoService _todoService;

  TodoRepository({required TodoService todoService}) : _todoService = todoService;

  Stream<List<ToDoModel>> getTodos() => _todoService.todos;

  Future<void> add(ToDoModel todo) async {
    _todoService.add(todo);
  }

  Future<void> update(ToDoModel todo) async {
    _todoService.update(todo);
  }

  Future<void> delete(ToDoModel todo) async {
    _todoService.delete(todo);
  }
}
