import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/presentation/pages/task_screen.dart';
import 'package:really_simple_todolist_app/core/utils/data_list.dart';
import 'package:really_simple_todolist_app/presentation/widgets/custom_card_widget.dart';
import 'package:really_simple_todolist_app/presentation/widgets/custom_dropdown_button.dart';
import 'package:really_simple_todolist_app/gen/assets.gen.dart';
import 'package:really_simple_todolist_app/presentation/widgets/list_of_todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHave = true;

  String dropdownValue = 'Today';
  String dropdownValue2 = 'Completed';

  List<List<String>> items = [
    ['Today', 'Today'],
    ['Tomorrow', 'Tomorrow'],
    ['Next 7 days', 'Next 7 days'],
    ['Custom', 'Custom'],
  ];

  List<List<String>> items2 = [
    ['Completed', 'Completed'],
    ['Not Completed', 'Not Completed'],
  ];

  void onChanged(String? value) {
    setState(() {
      dropdownValue = value!;
    });
  }

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
      body: isHave
          ? Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropdownButton(dropdownValue: dropdownValue, items: items, onChanged: onChanged),
                  const SizedBox(height: 20),
                  ListOfTodoCards(todoList: todoList),
                  CustomDropdownButton(dropdownValue: dropdownValue2, items: items2, onChanged: onChanged),
                  const SizedBox(height: 20),
                  CustomCardWidget(
                    toDoModel: todoList[0],
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TaskScreen(
                          toDoModel: todoList[0],
                        )),
                      );
                    },
                  ),
                ],
              ),
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      SvgPicture.asset(Assets.icons.welcome),
                      const SizedBox(height: 20),
                      Text('What do you want to do today?', style: context.tl),
                      const SizedBox(height: 20),
                      Text('Tap + to add your tasks', style: context.tm),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
