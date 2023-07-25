import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerPage extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _image;

  Future<void> _takePicture() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  Future<void> _pickImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0), // Adjust the blur intensity here
          child: Container(
            color: Colors.black.withOpacity(0.4), // Adjust the opacity of the blurred background
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _takePicture,
                    child: Text('Take Picture'),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _pickImage,
                    child: Text('Pick Image from Gallery'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


void main() {
  runApp(MaterialApp(
    home: ImagePickerPage(),
  ));
}
