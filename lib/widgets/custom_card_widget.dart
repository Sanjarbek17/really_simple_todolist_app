import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/models/todo_model.dart';

class CustomCardWidget extends StatelessWidget {
  final ToDoModel toDoModel;
  final void Function()? onTap;
  final Color? backgroundColor;
  const CustomCardWidget({
    super.key,
    required this.toDoModel,
    this.onTap,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: backgroundColor ?? CustomColors.secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(
                value: toDoModel.isCompleted,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                onChanged: (value) {},
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.72,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(toDoModel.title, style: context.tm),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Today At ${toDoModel.date.hour}:${toDoModel.date.minute}', style: context.ts),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(color: Color(toDoModel.category.color), borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  Icon(toDoModel.category.icon, size: 14),
                                  const SizedBox(width: 5),
                                  Text(toDoModel.category.name, style: context.lm),
                                ],
                              ),
                            ),
                            const SizedBox(width: 13),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(border: Border.all(color: CustomColors.purple), borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  const Icon(Icons.flag_outlined, size: 14),
                                  const SizedBox(width: 5),
                                  Text(toDoModel.priority.toString(), style: context.lm),
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
