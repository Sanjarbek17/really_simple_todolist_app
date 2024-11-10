
import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/data/models/todo_model.dart';

class TaskCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget child;
  final void Function()? onTap;
  const TaskCard({
    super.key,
    required this.toDoModel,
    required this.icon,
    required this.title,
    required this.child, this.onTap,
  });

  final ToDoModel toDoModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 27.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 10),
          Text(
            title,
            style: context.tm,
          ),
          const Spacer(),
          InkWell(
            onTap: onTap,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: CustomColors.secondaryColor,
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
