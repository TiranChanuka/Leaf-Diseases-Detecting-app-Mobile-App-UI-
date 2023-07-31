import 'dart:io';
import 'dart:ui';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_app/Colors.dart';

class ImagePickerPageTomato extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPageTomato> {
  File? _image;

  Future<void> _takePicture() async {
    final image = await ImagePicker().getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      await _uploadImage();
    }
  }

  Future<void> _pickImage() async {
    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      await _uploadImage();
    }
  }

  Future<void> _uploadImage() async {
    if (_image == null) {
      return; // No image to upload
    }

    final url = 'http://10.0.2.2:8000/predict';

    try {
      final dio = Dio();
      final formData = FormData.fromMap({
        'plant':'Tomato',
        'file': await MultipartFile.fromFile(_image!.path),
      });
      final response = await dio.post(url,data: formData);
      if (response.statusCode == 200) {
        final result = response.data;
        // Handle the response from the backend as needed
        print(result);
      } else {
        print('Failed to upload image: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''), // Empty title to remove the default app bar text
        backgroundColor: Colors.transparent, // Transparent app bar background
        elevation: 0, // No shadow
        centerTitle: true, // Center the logo
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Add your desired action here when the back button is pressed
            Navigator.pop(context); // This will navigate back to the previous screen
          },
        ),
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: 10), // Adjust the top padding to position your logo
          child: Center(
            child: Image.asset(
              'Images/logoWhite.png',
              height: 100, // Set the desired height for your logo
              // You can also adjust the width by using the width property
              // width: 100,
            ),
          ),
        ),//  Add a back button icon
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/back.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
          child: Container(
            color: Colors.black.withOpacity(0.4),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Tomato Leaf Identifier 🍅🍃🍂\n\n',
                    style: TextStyle(fontSize: 24, color: Colors.white,fontWeight:  FontWeight.bold,),

                  ),

                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _takePicture,
                    style: ElevatedButton.styleFrom(
                      primary: bgColor,
                      minimumSize: Size(200, 80),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Set the border radius here
                      ),
                    ),
                    child: Expanded(
                      child: Container(
                        width: 200,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Take Picture',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.camera_alt),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10), // Add some space between the buttons
                  ElevatedButton(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      primary: bgColor,
                      minimumSize: Size(240, 80),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20), // Set the border radius here
                      ),
                    ),
                    child: Expanded(
                      child: Container(
                        width: 300,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Pick Image from Gallery',
                              style: TextStyle(fontSize: 18),
                            ),
                            SizedBox(width: 5),
                            Icon(Icons.upload_file_sharp),
                          ],
                        ),
                      ),
                    ),
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
    home: ImagePickerPageTomato(),
  ));
}