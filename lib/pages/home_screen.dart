import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/gen/assets.gen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHave = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(Assets.icons.drawer),
          onPressed: () {},
        ),
        title: Text('Index', style: context.tl),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              children: [
                SvgPicture.asset(Assets.icons.welcome),
                const SizedBox(height: 20),
                Text(
                  'What do you want to do today?',
                  style: context.tl,
                ),
                const SizedBox(height: 20),
                Text(
                  'Tap + to add your tasks',
                  style: context.tm,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
