import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:really_simple_todolist_app/bloc/theme_manager.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/core/theme/custom_theme.dart';
import 'package:really_simple_todolist_app/pages/calendar_screen.dart';
import 'package:really_simple_todolist_app/pages/focuse_screen.dart';
import 'package:really_simple_todolist_app/pages/home_screen.dart';
import 'package:really_simple_todolist_app/pages/profile_screen.dart';


class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Widget> _screens = const [
    HomeScreen(),
    CalendarScreen(),
    SizedBox(),
    FocuseScreen(),
    ProfileScreen(),
  ];

  int _currentIndex = 0;

  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final themeManager = Provider.of<ThemeManager>(context);
    return MaterialApp(
      title: 'Simple TodoList',
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: themeManager.themeMode,
      home: Scaffold(
        body: PageView(
          controller: _pageController,
          children: _screens,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        floatingActionButton: Container(
          color: Colors.transparent,
          height: 100,
          width: 100,
          child: Align(
            alignment: Alignment.center,
            child: IconButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColors.purple,
                minimumSize: const Size(64,64),
              ),
              onPressed: () {
                themeManager.toogleTheme();
              },
              icon: const Icon(
                Icons.add,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
            _pageController.animateTo(
              MediaQuery.of(context).size.width * index,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
            );
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Index',
              backgroundColor: CustomColors.secondaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.calendar_month),
              label: 'Calendar',
              backgroundColor: CustomColors.secondaryColor,
            ),
            BottomNavigationBarItem(
              icon: SizedBox(),
              label: '',
              backgroundColor: CustomColors.secondaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.watch),
              label: 'Focuse',
              backgroundColor: CustomColors.secondaryColor,
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
              backgroundColor: CustomColors.secondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
