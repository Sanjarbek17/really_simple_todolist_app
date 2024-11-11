import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/data/models/todo_model.dart';
import 'package:really_simple_todolist_app/presentation/blocs/todo_bloc/todo_bloc.dart';

class CustomCardWidget extends StatefulWidget {
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
  State<CustomCardWidget> createState() => _CustomCardWidgetState();
}

class _CustomCardWidgetState extends State<CustomCardWidget> {
  late ToDoModel newModel;

  @override
  void initState() {
    super.initState();
    newModel = widget.toDoModel;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      splashColor: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 16.0),
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? CustomColors.secondaryColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Checkbox(
                value: newModel.isCompleted,
                splashRadius: 0,
                activeColor: CustomColors.purple,
                checkColor: CustomColors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                ),
                onChanged: (value) {
                  newModel = widget.toDoModel.copyWith(isCompleted: value);
                  context.read<TodoBloc>().add(
                        UpdateTodo(newModel, widget.toDoModel),
                      );
                  setState(() {});
                },
              ),
              SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.72,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.toDoModel.title, style: context.tm),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Today At ${widget.toDoModel.date.hour}:${widget.toDoModel.date.minute}', style: context.ts),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                              decoration: BoxDecoration(color: Color(widget.toDoModel.category.color), borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                children: [
                                  Icon(widget.toDoModel.category.icon, size: 14),
                                  const SizedBox(width: 5),
                                  Text(widget.toDoModel.category.name, style: context.lm),
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
                                  Text(widget.toDoModel.priority.toString(), style: context.lm),
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
