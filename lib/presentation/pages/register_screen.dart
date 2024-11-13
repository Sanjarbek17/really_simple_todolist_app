import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_theme.dart';
import 'package:really_simple_todolist_app/presentation/blocs/theme_manager.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: Provider.of<ThemeManager>(context).themeMode,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 50),
              const Text('Register', style: TextStyle(fontSize: 32)),
              const SizedBox(height: 50),
              const Text('Username'),
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
              const SizedBox(height: 30),
              const Text('Confirm Password'),
              const SizedBox(height: 10),
              TextField(
                cursorColor: context.theme.primary,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
                  hintText: 'Confirm your Password',
                ),
              ),
              const SizedBox(height: 50),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), backgroundColor: context.theme.primary, minimumSize: const Size(100, 50)),
                      child: Text('Register', style: context.tl?.copyWith(color: Colors.white)),
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
