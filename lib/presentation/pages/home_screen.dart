import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:really_simple_todolist_app/core/utils/data_list.dart';
import 'package:really_simple_todolist_app/presentation/widgets/custom_dropdown_button.dart';
import 'package:really_simple_todolist_app/gen/assets.gen.dart';
import 'package:really_simple_todolist_app/presentation/widgets/empty_cards_page.dart';
import 'package:really_simple_todolist_app/presentation/widgets/list_of_todo_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isHave = true;

  String dropdownValue = 'Today';

  List<List<String>> items = [
    ['Today', 'Today'],
    ['Tomorrow', 'Tomorrow'],
    ['Next 7 days', 'Next 7 days'],
    ['Custom', 'Custom'],
  ];

  void onChanged(String? value) {
    setState(() {
      dropdownValue = value!;
    });
  }

  @override
  void initState() {
    BlocProvider.of<TodoBloc>(context).add(GetTodo());
    super.initState();
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
        body: BlocBuilder<TodoBloc, TodoState>(
          builder: (context, state) {
            if (state.status == TodoStatus.loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state.status == TodoStatus.error) {
              return const Center(
                child: Text('Error'),
              );
            }
            if (state.status == TodoStatus.loaded) {
              todoList = state.todoList;
              if (todoList.isEmpty) {
                return const EmptyCardsPage();
              }
              return Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropdownButton(dropdownValue: dropdownValue, items: items, onChanged: onChanged),
                    const SizedBox(height: 20),
                    ListOfTodoCards(todoList: todoList),
                  ],
                ),
              );
            }
            return const EmptyCardsPage();
          },
        ));
  }
}
