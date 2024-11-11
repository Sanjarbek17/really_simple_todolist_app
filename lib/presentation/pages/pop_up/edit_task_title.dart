import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/data/models/todo_model.dart';

class EditTaskTitle extends StatefulWidget {
  final ToDoModel toDoModel;
  const EditTaskTitle({super.key, required this.toDoModel});

  @override
  State<EditTaskTitle> createState() => _EditTaskTitleState();
}

class _EditTaskTitleState extends State<EditTaskTitle> {
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    titleController.text = widget.toDoModel.title;
    descriptionController.text = widget.toDoModel.description;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Task Title', textAlign: TextAlign.center),
      titleTextStyle: context.tl,
      backgroundColor: CustomColors.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              ),
            ),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(backgroundColor: Colors.transparent, minimumSize: const Size(140, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), shadowColor: Colors.transparent),
          child: Text('Cancel', style: context.tm?.copyWith(color: CustomColors.purple)),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(
              context,
              widget.toDoModel.copyWith(
                title: titleController.text,
                description: descriptionController.text,
              ),
            );
          },
          style: ElevatedButton.styleFrom(minimumSize: const Size(150, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), backgroundColor: CustomColors.purple),
          child: Text('Edit', style: context.tm),
        ),
      ],
    );
  }
}
