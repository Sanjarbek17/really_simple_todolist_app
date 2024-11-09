import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:really_simple_todolist_app/core/theme/custom_theme.dart';

import 'package:really_simple_todolist_app/bloc/theme_manager.dart';
import 'package:really_simple_todolist_app/my_app.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => ThemeManager(),
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      title: 'Simple TodoList',
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: themeManager.themeMode,
      home: const MyApp(),
    );
  }
}
