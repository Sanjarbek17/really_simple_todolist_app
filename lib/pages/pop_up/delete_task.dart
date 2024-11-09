import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';

class DeleteTask extends StatelessWidget {
  final String title;
  const DeleteTask({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Edit Task Title', textAlign: TextAlign.center),
      titleTextStyle: context.tl,
      backgroundColor: CustomColors.secondaryColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            Text('Are you sure you want to delete this task?', style: context.ts),
            const SizedBox(height: 10),
            Text('Task title: $title', style: context.tm),
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
          onPressed: () {},
          style: ElevatedButton.styleFrom(minimumSize: const Size(150, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), backgroundColor: CustomColors.purple),
          child: Text('Delete', style: context.tm),
        ),
      ],
    );
  }
}
