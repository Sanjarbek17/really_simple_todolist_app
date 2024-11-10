import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:really_simple_todolist_app/core/extension/build_context_extension.dart';
import 'package:really_simple_todolist_app/core/theme/custom_colors.dart';

class CustomDropdownButton extends StatelessWidget {
  final String dropdownValue;
  final Function(String?)? onChanged;
  final List<List<String>> items;
  const CustomDropdownButton({
    super.key,
    required this.dropdownValue,
    this.onChanged,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        iconStyleData: const IconStyleData(
          icon: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.keyboard_arrow_down),
          ),
          openMenuIcon: Padding(
            padding: EdgeInsets.only(right: 10.0),
            child: Icon(Icons.keyboard_arrow_up),
          ),
        ),
        value: dropdownValue,
        onChanged: onChanged,
        items: items.map((List<String> value) {
          return DropdownMenuItem<String>(
            value: value.first,
            child: Text(
              value.last,
              style: context.ll,
            ),
          );
        }).toList(),
        buttonStyleData: ButtonStyleData(
          // width: 60,
          padding: EdgeInsets.zero,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: CustomColors.secondaryColor,
          ),
        ),
        dropdownStyleData: const DropdownStyleData(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: CustomColors.secondaryColor,
          ),
          elevation: 5,
          padding: EdgeInsets.zero,
          offset: Offset(0, -10),
        ),
      ),
    );
  }
}
