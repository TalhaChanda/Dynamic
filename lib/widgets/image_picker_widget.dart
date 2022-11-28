import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  // File? _pickedImage;
  // void _pickImage() async {
  //   final pickedImageFile =
  //       await ImagePicker.platform.pickImage(source: ImageSource.camera);
  //   setState(() {
  //     _pickedImage = pickedImageFile;
  //   });
  // }
  final imagePicker = ImagePicker();
  File? _pickedImage;

  Future _pickImage() async {
    var image = await imagePicker.getImage(source: ImageSource.camera);
    setState(() {
      _pickedImage = File(image!.path);
    });
    print(image!.path);
    print(_pickedImage);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage:
              _pickedImage != null ? FileImage(_pickedImage!) : null,
        ),
        ElevatedButton.icon(
          onPressed: _pickImage,
          icon: Icon(Icons.image),
          label: Text("Add Image"),
        )
      ],
    );
  }
}
