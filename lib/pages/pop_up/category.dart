import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';
import 'package:really_simple_todolist_app/utils/data_list.dart';

class Category extends StatelessWidget {
  const Category({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Choose Category', textAlign: TextAlign.center),
      titleTextStyle: context.tl,
      backgroundColor: CustomColors.secondaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
      content: SizedBox(
        width: MediaQuery.sizeOf(context).width * 0.8,
        child:  Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(),
            const SizedBox(height: 10),
            GridView.count(
              crossAxisCount: 3,
              shrinkWrap: true,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: categoryList
                  .map(
                    (category) => Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(category.color),
                            minimumSize: const Size(50, 70),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4),
                            ),
                            shadowColor: Colors.transparent,
                          ),
                          child: Icon(category.icon, color: Colors.white, size: 30,),
                        ),
                         Text(category.name, style: context.tm)
                      ],
                    ),
                  )
                  .toList(),
            )
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            minimumSize: const Size(140, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            shadowColor: Colors.transparent,
          ),
          child: Text(
            'Save',
            style: context.tm?.copyWith(
              color: CustomColors.purple,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(150, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            backgroundColor: CustomColors.purple,
          ),
          child: Text('Cancel', style: context.tm),
        ),
      ],
    );
  }
}
