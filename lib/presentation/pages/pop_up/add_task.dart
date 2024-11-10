// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/core/utils/data_list.dart';
import 'package:really_simple_todolist_app/core/utils/exceptions.dart';
import 'package:really_simple_todolist_app/data/models/todo_model.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/category.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/show_date_time.dart';
import 'package:really_simple_todolist_app/presentation/pages/pop_up/task_priority.dart';

class AddTask extends StatefulWidget {
  final String? title;
  final String? description;
  const AddTask({super.key, this.title, this.description});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final TextEditingController _titleController = TextEditingController(text: '');
  final TextEditingController _descriptionController = TextEditingController(text: '');

  ToDoModel? todoModel;

  DateTime? dateTime;
  int? categoryId;
  int? taskPriorityId;

  Future<void> chooseDateTime(BuildContext context) async {
    dateTime = await showDateTimePicker(context: context);
    if (dateTime == null) {
      Navigator.pop(context);
      throw NotSelectedException('Date Time is not selected');
    }
  }

  Future<void> chooseCategory(BuildContext context) async {
    if (context.mounted) {
      categoryId = await showDialog<int>(
        context: context,
        builder: (context) {
          return const Category();
        },
      );
      if (categoryId == null) {
        Navigator.pop(context);
        throw NotSelectedException('Category is not selected');
      }
    }
  }

  Future<void> chooseTaskPriority(BuildContext context) async {
    if (context.mounted) {
      taskPriorityId = await showDialog<int>(
        context: context,
        builder: (context) {
          return const TaskPriority();
        },
      );
      if (taskPriorityId == null) {
        Navigator.pop(context);
        throw NotSelectedException('Task Priority is not selected');
      }
    }
  }

  Future<void> saveTask(BuildContext context) async {
    if (_titleController.text.isEmpty || _descriptionController.text.isEmpty || dateTime == null || categoryId == null || taskPriorityId == null) {
      if (context.mounted) {
        Navigator.pop(context);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please fill all fields'),
          ),
        );
      }
      return;
    }
    todoModel = ToDoModel(
      title: _titleController.text,
      description: _descriptionController.text,
      date: dateTime!,
      category: categoryList[categoryId!],
      priority: taskPriorityId!,
      isCompleted: false,
    );

    // context.read<TodoBloc>().add(AddTodo(todoModel!));
    Navigator.pop(context, todoModel);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 25,
        left: 25,
        right: 25,
        bottom: 16,
      ),
      decoration: const BoxDecoration(
        color: CustomColors.secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text('Add Task', style: context.tl),
          const SizedBox(height: 20),
          TextField(
            controller: _titleController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              hintText: widget.title ?? 'Title',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            controller: _descriptionController,
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              hintText: widget.description ?? 'Description',
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () async {
                  try {
                    await chooseDateTime(context);
                    await chooseCategory(context);
                    await chooseTaskPriority(context);
                    // check if all fields are filled
                    await saveTask(context);
                  } on NotSelectedException catch (_) {
                  }
                },
                icon: const Icon(Icons.timer_outlined),
              ),
              IconButton(
                onPressed: () async {
                  try {
                    await chooseCategory(context);
                    await chooseTaskPriority(context);
                    // check if all fields are filled
                    saveTask(context);
                  } on NotSelectedException catch (_) {
                  }
                },
                icon: const Icon(Icons.sell_outlined),
              ),
              IconButton(
                onPressed: () async {
                  try {
                    await chooseTaskPriority(context);
                    // check if all fields are filled
                    await saveTask(context);
                  } on NotSelectedException catch (_) {
                  }
                },
                icon: const Icon(Icons.flag_outlined),
              ),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  try {
                    await chooseDateTime(context);
                    await chooseCategory(context);
                    await chooseTaskPriority(context);
                    // check if all fields are filled
                    await saveTask(context);
                  } on NotSelectedException catch (_) {
                  }
                },
                icon: const Icon(Icons.send, color: CustomColors.purple),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
