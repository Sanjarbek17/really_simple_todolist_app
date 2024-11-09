import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/models/todo_model.dart';

Future<DateTime?> showDateTimePicker({
  required BuildContext context,
  ToDoModel? toDoModel,
  DateTime? firstDate,
  DateTime? lastDate,
}) async {
  DateTime initialDate = toDoModel?.date ?? DateTime.now();
  firstDate ??= DateTime.now();
  lastDate ??= DateTime(2100);

  final DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: initialDate,
    firstDate: firstDate,
    lastDate: lastDate,
  );

  if (selectedDate == null) return null;

  if (!context.mounted) return selectedDate;

  final TimeOfDay? selectedTime = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.fromDateTime(initialDate),
  );

  return selectedTime == null
      ? selectedDate
      : DateTime(
          selectedDate.year,
          selectedDate.month,
          selectedDate.day,
          selectedTime.hour,
          selectedTime.minute,
        );
}
