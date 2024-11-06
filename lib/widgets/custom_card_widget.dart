import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
      decoration: BoxDecoration(
        color: CustomColors.secondaryColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          // TODO: Make this circle
          Checkbox(
            value: false,
            onChanged: (value) {},
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Do Math Homework', style: context.tm),
              const SizedBox(height: 16),
              Text('Today At 16:45', style: context.ts),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const SizedBox(height: 50),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(color: CustomColors.blue, borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      children: [
                        const Icon(Icons.school, size: 14),
                        const SizedBox(width: 5),
                        Text('University', style: context.lm),
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
                        Text('1', style: context.lm),
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
