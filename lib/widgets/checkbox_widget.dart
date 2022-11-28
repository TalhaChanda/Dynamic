import 'package:flutter/material.dart';

class CheckBoxWidget extends StatelessWidget {
  CheckBoxWidget({this.onChanged, this.value,this.title, super.key});
  bool? value;
  void Function(bool?)? onChanged;
  String? title;


  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(title.toString()),
      value: value, onChanged: onChanged);
  }
}
