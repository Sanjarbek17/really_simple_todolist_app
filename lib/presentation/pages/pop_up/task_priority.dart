import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';

class TaskPriority extends StatelessWidget {
  final int? priority;
  const TaskPriority({super.key, this.priority});

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
            GridView.count(
              crossAxisCount: 4,
              shrinkWrap: true,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              children: List.generate(10, (index) {
                return ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(minimumSize: const Size(50, 50), backgroundColor: index != priority ? CustomColors.prioritybg : CustomColors.purple, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.flag_outlined, color: Colors.white),
                      Text('${index + 1}', style: context.tm),
                    ],
                  ),
                );
              }),
            )
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
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(minimumSize: const Size(150, 50), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)), backgroundColor: CustomColors.purple),
          child: Text(priority == null ? 'Save' : 'Edit', style: context.tm),
        ),
      ],
    );
  }
}
