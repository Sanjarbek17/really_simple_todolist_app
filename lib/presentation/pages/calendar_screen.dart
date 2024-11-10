import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/core/utils/data_list.dart';
import 'package:really_simple_todolist_app/presentation/widgets/list_of_todo_card.dart';
import 'package:really_simple_todolist_app/presentation/widgets/today_or_completed_button.dart';
import 'package:really_simple_todolist_app/presentation/widgets/weeks_day_list.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  bool isCompleted = false;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SafeArea(
        child: Column(
          children: [
            Text('Calendar', style: context.tl),
            const SizedBox(height: 20),
            Container(
              color: CustomColors.secondaryColor,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_back_ios, color: CustomColors.text2),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('FEBRUARY', style: context.tl),
                          Text('2021', style: context.tm?.copyWith(color: CustomColors.text2)),
                        ],
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.arrow_forward_ios, color: CustomColors.text2),
                      ),
                    ],
                  ),
                  const WeekDayList(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  TodayOrCompletedButton(
                    isCompleted: isCompleted,
                    onPressed: () {
                      setState(() {
                        isCompleted = !isCompleted;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ListOfTodoCards(
                    todoList: isCompleted
                        ? todoList
                            .getRange(
                              0,
                              3,
                            )
                            .toList()
                        : todoList.getRange(0, 1).toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
