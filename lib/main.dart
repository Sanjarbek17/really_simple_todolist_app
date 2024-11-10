import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:really_simple_todolist_app/core/theme/custom_theme.dart';
import 'package:really_simple_todolist_app/data/repository/todo_repository.dart';
import 'package:really_simple_todolist_app/data/services/todo_service.dart';

import 'package:really_simple_todolist_app/presentation/bloc/theme_manager.dart';
import 'package:really_simple_todolist_app/my_app.dart';
import 'package:really_simple_todolist_app/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();

  final TodoService todoService = TodoService(prefs: prefs);
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeManager(),
      child: App(todoService: todoService),
    ),
  );
}

class App extends StatelessWidget {
  final TodoService todoService;
  const App({super.key, required this.todoService});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return BlocProvider(
      create: (context) => TodoBloc(
        todoRepository: TodoRepository(todoService: todoService),
      )
        ..add(GetTodo()),
      child: MaterialApp(
        title: 'Simple TodoList',
        darkTheme: darkTheme,
        theme: lightTheme,
        themeMode: themeManager.themeMode,
        home: const MyApp(),
      ),
    );
  }
}
