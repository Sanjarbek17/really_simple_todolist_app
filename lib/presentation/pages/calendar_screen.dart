import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/data/models/todo_model.dart';
import 'package:really_simple_todolist_app/presentation/bloc/todo_bloc/todo_bloc.dart';
import 'package:really_simple_todolist_app/presentation/widgets/empty_cards_page.dart';
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
  DateTime now = DateTime.now();
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
                        onPressed: () {
                          now = now.subtract(const Duration(days: 31));
                          setState(() {});
                        },
                        icon: const Icon(Icons.arrow_back_ios, color: CustomColors.text2),
                      ),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            DateFormat.MMMM().format(now).toUpperCase(),
                            style: context.tl,
                          ),
                          Text(now.year.toString(), style: context.tm?.copyWith(color: CustomColors.text2)),
                        ],
                      ),
                      IconButton(
                        onPressed: () {
                          now = now.add(const Duration(days: 31));
                          setState(() {});
                        },
                        icon: const Icon(Icons.arrow_forward_ios, color: CustomColors.text2),
                      ),
                    ],
                  ),
                  WeekDayList(now: now),
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
                  BlocBuilder<TodoBloc, TodoState>(
                    builder: (context, state) {
                      if (state.status == TodoStatus.loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (state.status == TodoStatus.error) {
                        return const Center(
                          child: Text('Error'),
                        );
                      }
                      if (state.status == TodoStatus.loaded) {
                        List<ToDoModel> todoList = state.todoList;
                        if (todoList.isEmpty) {
                          return const EmptyCardsPage();
                        }
                        if (isCompleted) {
                          todoList = todoList.where((element) => element.isCompleted).toList();
                        } else {
                          todoList = todoList.where((element) => element.date.day == now.day && !element.isCompleted).toList();
                        }
                        return ListOfTodoCards(todoList: todoList);
                      }
                      return const EmptyCardsPage();
                    },
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
