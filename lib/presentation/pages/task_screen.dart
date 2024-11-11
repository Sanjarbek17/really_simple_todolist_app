import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/data/models/todo_model.dart';
import 'package:really_simple_todolist_app/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/category.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/delete_task.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/edit_task_title.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/show_date_time.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/task_priority.dart';
import 'package:really_simple_todolist_app/presentation/widgets/task_card.dart';

class TaskScreen extends StatefulWidget {
  final ToDoModel toDoModel;
  const TaskScreen({super.key, required this.toDoModel});

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {
  late ToDoModel newTodo;

  @override
  void initState() {
    super.initState();
    newTodo = widget.toDoModel;
  }

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
                    value: newTodo.isCompleted,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
                    onChanged: (value) {},
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(newTodo.title, style: context.tl),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.62,
                        child: Text(newTodo.description, style: context.tm?.copyWith(color: CustomColors.text2), maxLines: 1),
                      ),
                    ],
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: () async {
                      newTodo = await showDialog(
                        context: context,
                        builder: (context) {
                          return EditTaskTitle(toDoModel: newTodo);
                        },
                      );
                      setState(() {});
                    },
                    icon: const Icon(Icons.border_color_outlined),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              TaskCard(
                toDoModel: newTodo,
                icon: Icons.timer_outlined,
                title: 'Task Time:',
                onTap: () async {
                  DateTime? dateTime = await showDateTimePicker(context: context, toDoModel: newTodo);
                  if (dateTime != null && context.mounted) {
                    newTodo = newTodo.copyWith(date: dateTime);
                    setState(() {});
                  }
                },
                child: Text('Today At ${newTodo.date.hour}:${newTodo.date.minute}', style: context.ll),
              ),
              TaskCard(
                toDoModel: newTodo,
                icon: Icons.sell_outlined,
                title: 'Task Category:',
                onTap: () async {
                  int? categoryId = await showDialog<int>(
                    context: context,
                    builder: (context) {
                      return const Category();
                    },
                  );
                  if (categoryId != null && context.mounted) {
                    newTodo = newTodo.copyWith(categoryId: categoryId);
                    setState(() {});
                  }
                },
                child: Row(
                  children: [
                    Icon(newTodo.category.icon),
                    const SizedBox(width: 10),
                    Text(newTodo.category.name, style: context.ll),
                  ],
                ),
              ),
              TaskCard(
                toDoModel: newTodo,
                icon: Icons.flag_outlined,
                title: 'Task Priority:',
                onTap: () async {
                  int? priority = await showDialog<int>(
                    context: context,
                    builder: (context) {
                      return TaskPriority(priority: newTodo.priority);
                    },
                  );
                  if (priority != null && context.mounted) {
                    newTodo = newTodo.copyWith(priority: priority);
                    setState(() {});
                  }
                },
                child: Text(newTodo.priority.toString(), style: context.ll),
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => DeleteTask(
                      title: newTodo.title,
                      onDelete: () {
                        context.read<TodoBloc>().add(DeleteTodo(newTodo));
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.delete_outline, color: CustomColors.red),
                    Text('Delete Task', style: context.tm?.copyWith(color: CustomColors.red)),
                  ],
                ),
              ),
              const Spacer(),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<TodoBloc>().add(UpdateTodo(newTodo, widget.toDoModel));
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(minimumSize: const Size(300, 48), backgroundColor: CustomColors.purple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
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
