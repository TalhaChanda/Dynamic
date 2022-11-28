import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({this.buttonText,this.onPressed,super.key});
  final void Function()? onPressed;
  final String? buttonText; 


  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.orange,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              size.height * .07,
            ),
          )),
      onPressed: onPressed,
      child: Text(
        buttonText.toString(),
        style: TextStyle(
          fontSize: size.height * .025,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
