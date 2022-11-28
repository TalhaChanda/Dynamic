import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget(
      {this.controller,
      this.hintText,
      this.validator,
      this.obscureText,
      this.onTap,
      this.readOnly,
      this.onSaved,
      this.keyboardType,
      super.key});

  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final String? hintText;
  final bool? obscureText;
  final void Function()? onTap;
  final bool? readOnly;
  final Function(String?)? onSaved;
  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return TextFormField(
      onSaved: onSaved,
      readOnly: readOnly ?? false,
      obscureText: obscureText ?? false,
      cursorColor: Colors.orange,
      keyboardType: keyboardType,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.grey[400],
          fontSize: size.height * .02,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey[300]!,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.orange,
          ),
        ),
      ),
      onTap: onTap,
    );
  }
}
