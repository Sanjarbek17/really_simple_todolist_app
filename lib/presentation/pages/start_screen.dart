import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_theme.dart';
import 'package:really_simple_todolist_app/presentation/blocs/theme_manager.dart';
import 'package:really_simple_todolist_app/presentation/pages/login_screen.dart';
import 'package:really_simple_todolist_app/presentation/pages/register_screen.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: Provider.of<ThemeManager>(context).themeMode,
      home: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                const Spacer(),
                Text('Welcom to UpTodo', style: context.hl?.copyWith(color: Colors.white)),
                const SizedBox(height: 10),
                const Text('Please login to your account or create new account to continue', textAlign: TextAlign.center, style: TextStyle(fontSize: 16, color: Colors.white)),
                const Spacer(),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: context.theme.primary)), backgroundColor: context.theme.primary, minimumSize: const Size(100, 60)),
                        child: Text('LOGIN', style: context.tl?.copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10), side: BorderSide(color: context.theme.primary)), backgroundColor: Colors.transparent, shadowColor: Colors.transparent, minimumSize: const Size(100, 60)),
                        child: Text('CREATE ACCOUNT', style: context.tl?.copyWith(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
