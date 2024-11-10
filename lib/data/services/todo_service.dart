import 'dart:convert';

import 'package:really_simple_todolist_app/data/models/todo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rxdart/rxdart.dart';

class TodoService {
  final SharedPreferences _prefs;

  TodoService({required SharedPreferences prefs}) : _prefs = prefs {
    _fetchTodos();
  }

  late final _todoStreamController = BehaviorSubject<List<ToDoModel>>.seeded(const []);

  final String _todoKey = 'todos';

  void _fetchTodos() {
    final List<String> todos = _prefs.getStringList(_todoKey) ?? [];
    final List<ToDoModel> todoModels = todos.map((e) => ToDoModel.fromJson(jsonDecode(e))).toList();
    _todoStreamController.add(todoModels);
  }

  Stream<List<ToDoModel>> getTodos() => _todoStreamController.asBroadcastStream();

  Future<void> add(ToDoModel todo) async {
    final List<ToDoModel> todos = [..._todoStreamController.value];
    todos.add(todo);
    _todoStreamController.add(todos);
    await _prefs.setStringList(_todoKey, todos.map((e) => jsonEncode(e.toJson())).toList());
  }

  Future<void> update(ToDoModel todo) async {
    final List<ToDoModel> todos = [..._todoStreamController.value];
    final index = todos.indexWhere((element) => element == todo);
    todos[index] = todo;
    _todoStreamController.add(todos);
    await _prefs.setStringList(_todoKey, todos.map((e) => jsonEncode(e.toJson())).toList());
  }

  Future<void> delete(ToDoModel todo) async {
    final List<ToDoModel> todos = [..._todoStreamController.value];
    todos.remove(todo);
    _todoStreamController.add(todos);
    await _prefs.setStringList(_todoKey, todos.map((e) => jsonEncode(e.toJson())).toList());
  }
}
