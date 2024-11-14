import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_theme.dart';
import 'package:really_simple_todolist_app/presentation/blocs/login_bloc/login_bloc.dart';
import 'package:really_simple_todolist_app/presentation/blocs/theme_manager.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(
        authenticationRepository: RepositoryProvider.of<AuthenticationRepository>(context),
      ),
      child: const RegisterForm(),
    );
  }
}

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

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
              _UsernameInput(),
              const SizedBox(height: 30),
              const Text('Password'),
              const SizedBox(height: 10),
              _PasswordInput(),
              const SizedBox(height: 30),
              const Text('Confirm Password'),
              const SizedBox(height: 10),
              _ConfirmPasswordInput(),
              const SizedBox(height: 50),
              const _RegisterButton(),
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

class _RegisterButton extends StatelessWidget {
  const _RegisterButton();

  @override
  Widget build(BuildContext context) {
    final isValid = context.select((LoginBloc bloc) => bloc.state.isValid);
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: isValid ? () => context.read<LoginBloc>().add(const LoginSubmitted()) : null,
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)), backgroundColor: context.theme.primary, minimumSize: const Size(100, 50)),
            child: Text('Login', style: context.tl?.copyWith(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}

class _UsernameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select((LoginBloc bloc) => bloc.state.username.displayError);
    return TextField(
      key: const Key('loginForm_usernameInput_textField'),
      onChanged: (username) => context.read<LoginBloc>().add(LoginUsernameChanged(username)),
      cursorColor: context.theme.primary,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        hintText: 'Enter your Username',
        errorText: displayError != null ? 'Invalid username' : null,
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select((LoginBloc bloc) => bloc.state.password.displayError);
    return TextField(
      onChanged: (password) => context.read<LoginBloc>().add(LoginPasswordChanged(password)),
      cursorColor: context.theme.primary,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        hintText: 'Enter your Password',
        errorText: displayError != null ? 'Invalid password' : null,
      ),
    );
  }
}

class _ConfirmPasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final displayError = context.select(
      (LoginBloc bloc) => bloc.state.confirmPassword.displayError,
    );
    return TextField(
      onChanged: (password) => context.read<LoginBloc>().add(
            ConfirmLoginPasswordChanged(
              context.read<LoginBloc>().state.password.value,
              password,
            ),
          ),
      cursorColor: context.theme.primary,
      decoration: InputDecoration(
        border: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
        enabledBorder: const OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        hintText: 'Confirm your Password',
        errorText: displayError != null ? 'Passwords does not match' : null,
      ),
    );
  }
}
