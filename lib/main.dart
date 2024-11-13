import 'package:authentication_repository/authentication_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:really_simple_todolist_app/core/theme/custom_theme.dart';
import 'package:really_simple_todolist_app/data/repository/todo_repository.dart';
import 'package:really_simple_todolist_app/data/services/todo_service.dart';
import 'package:really_simple_todolist_app/presentation/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:really_simple_todolist_app/presentation/blocs/date_cubit.dart';

import 'package:really_simple_todolist_app/presentation/blocs/theme_manager.dart';
import 'package:really_simple_todolist_app/my_app.dart';
import 'package:really_simple_todolist_app/presentation/blocs/todo_bloc/todo_bloc.dart';
import 'package:really_simple_todolist_app/presentation/pages/intro.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_repository/user_repository.dart';

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

class App extends StatefulWidget {
  final TodoService todoService;

  const App({super.key, required this.todoService});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late final AuthenticationRepository _authenticationRepository;
  late final UserRepository _userRepository;

  @override
  void initState() {
    super.initState();
    _authenticationRepository = AuthenticationRepository();
    _userRepository = UserRepository();
  }

  @override
  void dispose() {
    _authenticationRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return RepositoryProvider.value(
      value: (context) => _userRepository,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthenticationBloc(
              authenticationRepository: _authenticationRepository,
              userRepository: _userRepository,
            )..add(AuthenticationSubscriptionRequested()),
          ),
          BlocProvider(
            create: (context) => TodoBloc(
              todoRepository: TodoRepository(todoService: widget.todoService),
            )..add(GetTodo()),
          ),
          BlocProvider(
            create: (context) => DateCubit(),
          ),
        ],
        child: MaterialApp(
          title: 'Simple TodoList',
          darkTheme: darkTheme,
          theme: lightTheme,
          themeMode: themeManager.themeMode,
          home: const MyApp(),
        ),
      ),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  final _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState get _navigator => _navigatorKey.currentState!;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: _navigatorKey,
      builder: (context, child) {
        return BlocListener<AuthenticationBloc, AuthenticationState>(
          listener: (context, state) {
            switch (state.status) {
              case AuthenticationStatus.authenticated:
                _navigator.pushAndRemoveUntil<void>(
                  MaterialPageRoute(builder: (_) => const MyApp()),
                  (route) => false,
                );
              case AuthenticationStatus.unauthenticated:
                _navigator.pushAndRemoveUntil<void>(
                  //TODO: Change to login page
                  MaterialPageRoute(builder: (_) => const Intro()),
                  (route) => false,
                );
              case AuthenticationStatus.unknown:
                break;
            }
          },
          child: child,
        );
      },
      onGenerateRoute: (_) => MaterialPageRoute<void>(
        builder: (_) => const Scaffold(
          body: Intro(),
        ),
      ),
    );
  }
}
