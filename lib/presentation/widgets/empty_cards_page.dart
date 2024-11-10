
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/gen/assets.gen.dart';

class EmptyCardsPage extends StatelessWidget {
  const EmptyCardsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Column(
            children: [
              SvgPicture.asset(Assets.icons.welcome),
              const SizedBox(height: 20),
              Text('What do you want to do today?', style: context.tl),
              const SizedBox(height: 20),
              Text('Tap + to add your tasks', style: context.tm),
            ],
          ),
        ),
      ],
    );
  }
}