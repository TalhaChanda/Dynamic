import 'package:flutter/material.dart';

class RadioWidget extends StatelessWidget {
  RadioWidget({this.groupValue, this.onChanged, this.value,this.title, super.key});

  dynamic value;
  dynamic groupValue;
  void Function(dynamic)? onChanged;
  String? title;


  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      title: Text(title.toString()),
      value: value,
      groupValue: groupValue,
      onChanged: onChanged,
    );
  }
}
