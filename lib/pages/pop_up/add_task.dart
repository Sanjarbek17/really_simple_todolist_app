import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/pages/pop_up/category.dart';
import 'package:really_simple_todolist_app/pages/pop_up/show_date_time.dart';
import 'package:really_simple_todolist_app/pages/pop_up/task_priority.dart';

class AddTask extends StatelessWidget {
  final String? title;
  final String? description;
  const AddTask({super.key, this.title, this.description});

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
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              hintText: title ?? 'Title',
            ),
          ),
          const SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
              hintText: description ?? 'Description',
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () async {
                  await showDateTimePicker(context: context);
                  if (context.mounted) {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return const Category();
                      },
                    );
                  }
                },
                icon: const Icon(Icons.timer_outlined),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const Category();
                    },
                  );
                },
                icon: const Icon(Icons.sell_outlined),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return const TaskPriority();
                    },
                  );
                },
                icon: const Icon(Icons.flag_outlined),
              ),
              const Spacer(),
              IconButton(
                onPressed: () async {
                  // Navigator.pop(context);
                  await showDateTimePicker(context: context);
                  if (context.mounted) {
                    await showDialog(
                      context: context,
                      builder: (context) {
                        return const Category();
                      },
                    );
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
