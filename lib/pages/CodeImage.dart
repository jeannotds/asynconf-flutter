import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddEventPage extends StatefulWidget {
  const AddEventPage({super.key});

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final ImagePicker _imagePicker = ImagePicker();
  XFile? _selectedImage;

  Future<void> _pickImage() async {
    XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);
    if (file != null) {
      setState(() {
        _selectedImage = file; // Update the selected image
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _pickImage,
            child: const Text("Pick Image"),
          ),
          const SizedBox(height: 10),
          _selectedImage != null
              ? Image.file(
                  File(_selectedImage!.path),
                  width: 100, // Adjust the width and height as needed
                  height: 100,
                  fit: BoxFit.cover,
                )
              : const Text("No image selected"),
          // Other form fields here...
        ],
      ),
    );
  }
}
