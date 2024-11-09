
import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/models/todo_model.dart';
import 'package:really_simple_todolist_app/pages/task_screen.dart';
import 'package:really_simple_todolist_app/widgets/custom_card_widget.dart';

class ListOfTodoCards extends StatelessWidget {
  final List<ToDoModel> todoList;
  const ListOfTodoCards({
    super.key, required this.todoList,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return CustomCardWidget(
          toDoModel: todoList[index],
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  TaskScreen(
                toDoModel: todoList[index],
              )),
            );
          },
        );
      },
      itemCount: todoList.length,
    );
  }
}
