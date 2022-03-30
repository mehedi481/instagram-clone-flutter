import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

Future pickImage(ImageSource imageSource) async {
  String? name = null;
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _file = await _imagePicker.pickImage(source: imageSource);
  if (_file != null) {
    return await _file.readAsBytes();
  }
  debugPrint("No Image selected");
}

showSnackBar({String? content, BuildContext? context}) {
  ScaffoldMessenger.of(context!)
      .showSnackBar(SnackBar(content: Text(content!)));
}
