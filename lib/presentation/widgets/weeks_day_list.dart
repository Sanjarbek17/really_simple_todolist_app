import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/presentation/blocs/date_cubit.dart';

class WeekDayList extends StatefulWidget {
  final DateTime now;
  const WeekDayList({
    super.key,
    required this.now,
  });

  @override
  State<WeekDayList> createState() => _WeekDayListState();
}

class _WeekDayListState extends State<WeekDayList> {
  final List<String> weekDays = const ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
  late DateTime now;

  @override
  void initState() {
    super.initState();
    now = widget.now;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          DateTime tommorrow = widget.now
              .subtract(
                const Duration(days: 2),
              )
              .add(Duration(days: index));
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                now = tommorrow;
                context.read<DateCubit>().setDate(now);
                setState(() {});
              },
              child: Container(
                width: 60,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: now == tommorrow ? CustomColors.purple : CustomColors.thirdColor,
                ),
                child: Column(
                  children: [
                    Text(
                      weekDays[tommorrow.weekday - 1],
                      style: ['Sun', 'Sat'].contains(
                        weekDays[tommorrow.weekday - 1],
                      )
                          ? context.tm?.copyWith(color: Colors.red)
                          : context.tm,
                    ),
                    Text(tommorrow.day.toString(), style: context.tl),
                  ],
                ),
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 5);
        },
        itemCount: 30,
      ),
    );
  }
}
