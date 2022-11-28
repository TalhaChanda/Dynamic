import 'package:flutter/material.dart';

class DropdownWidget extends StatelessWidget {
  DropdownWidget({this.items, this.onChanged, this.value, super.key});
  dynamic value;
  List<DropdownMenuItem<dynamic>>? items;
  void Function(dynamic)? onChanged;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
