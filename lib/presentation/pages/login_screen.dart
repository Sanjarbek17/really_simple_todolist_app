import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_theme.dart';
import 'package:really_simple_todolist_app/presentation/blocs/theme_manager.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: Provider.of<ThemeManager>(context).themeMode,
      home: Scaffold(
        appBar: AppBar(
          leading: const Icon(Icons.arrow_back_ios),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Login'),
              const SizedBox(height: 10),
              TextField(
                cursorColor: context.theme.primary,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  hintText: 'Enter your Username',
                ),
              ),
              const SizedBox(height: 30),
              const Text('Password'),
              const SizedBox(height: 10),
              TextField(
                cursorColor: context.theme.primary,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  hintText: 'Enter your Password',
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(backgroundColor: context.theme.primary, minimumSize: const Size(100, 50)),
                      child: Text('Login', style: context.tl?.copyWith(color: Colors.white)),
                    ),
                  ),
                ],
              ),
              // Row(
              //   children: [
              //     const Expanded(child: Divider()),
              //     Text('  or  ', style: context.hs?.copyWith(color: Colors.grey)),
              //     const Expanded(child: Divider()),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
