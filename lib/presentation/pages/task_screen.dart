import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/data/models/todo_model.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/category.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/delete_task.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/edit_task_title.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/show_date_time.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/task_priority.dart';
import 'package:really_simple_todolist_app/presentation/widgets/task_card.dart';

class TaskScreen extends StatelessWidget {
  final ToDoModel toDoModel;
  const TaskScreen({super.key, required this.toDoModel});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () => Navigator.pop(context),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: CustomColors.thirdColor),
                child: const Icon(Icons.close),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5), color: CustomColors.thirdColor),
                child: const Icon(Icons.repeat),
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Checkbox(
                    value: toDoModel.isCompleted,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onChanged: (value) {},
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(toDoModel.title, style: context.tl),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.62,
                        child: Text(toDoModel.description, style: context.tm?.copyWith(color: CustomColors.text2), maxLines: 1),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const EditTaskTitle();
                        },
                      );
                    },
                    icon: const Icon(Icons.border_color_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TaskCard(
                toDoModel: toDoModel,
                icon: Icons.timer_outlined,
                title: 'Task Time:',
                onTap: () {
                  showDateTimePicker(context: context, toDoModel: toDoModel);
                },
                child: Text('Today At ${toDoModel.date.hour}:${toDoModel.date.minute}', style: context.ll),
              ),
              TaskCard(
                toDoModel: toDoModel,
                icon: Icons.sell_outlined,
                title: 'Task Category:',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Category();
                    },
                  );
                },
                child: Row(
                  children: [
                    Icon(toDoModel.category.icon),
                    const SizedBox(width: 10),
                    Text(toDoModel.category.name, style: context.ll),
                  ],
                ),
              ),
              TaskCard(
                toDoModel: toDoModel,
                icon: Icons.flag_outlined,
                title: 'Task Priority:',
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return TaskPriority(priority: toDoModel.priority);
                    },
                  );
                },
                child: Text(toDoModel.priority.toString(), style: context.ll),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => DeleteTask(title: toDoModel.title),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.delete_outline, color: CustomColors.red),
                    Text(
                      'Delete Task',
                      style: context.tm?.copyWith(color: CustomColors.red),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(300, 48),
                        backgroundColor: CustomColors.purple,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                      ),
                      child: Text('Edit Task', style: context.tm),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
