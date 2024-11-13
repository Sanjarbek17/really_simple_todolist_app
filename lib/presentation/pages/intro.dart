import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:really_simple_todolist_app/core/theme/custom_theme.dart';
import 'package:really_simple_todolist_app/presentation/blocs/theme_manager.dart';

class Intro extends StatelessWidget {
  const Intro({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: Provider.of<ThemeManager>(context).themeMode,
      home: const Scaffold(
        body: Center(
          child: Text('Intro Page'),
        ),
      ),
    );
  }
}
