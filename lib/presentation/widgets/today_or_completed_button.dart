import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';

class TodayOrCompletedButton extends StatelessWidget {
  final bool isCompleted;
  final void Function() onPressed;
  const TodayOrCompletedButton({super.key, required this.isCompleted, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      decoration: BoxDecoration(
        color: CustomColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          BigButton(
            isChoosen: !isCompleted,
            name: 'Today',
            onPressed: onPressed,
          ),
          const SizedBox(
            width: 10,
          ),
          BigButton(
            isChoosen: isCompleted,
            name: 'Completed',
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}

class BigButton extends StatelessWidget {
  final String name;
  final bool isChoosen;
  final void Function() onPressed;
  const BigButton({
    super.key,
    required this.isChoosen,
    required this.name,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(0, 50),
          side: isChoosen ? null : const BorderSide(color: Colors.white, width: 1),
          backgroundColor: isChoosen ? CustomColors.purple : Colors.transparent,
          shadowColor: isChoosen ? null : Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        child: Text(name, style: context.tm),
      ),
    );
  }
}
