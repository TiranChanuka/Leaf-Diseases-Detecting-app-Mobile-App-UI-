import 'dart:io';
import 'dart:ui';
import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:plant_app/Colors.dart';
import '../Screens/ResultShowingScreen.dart';

class ImagePickerPageTomato extends StatefulWidget {
  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPageTomato> {
  File? _image;
  bool _isConnected = true;
  Stream<ConnectivityResult> _connectivityStream =
  Stream<ConnectivityResult>.empty();

  bool _loading = false; // Added loading variable

  @override
  void initState() {
    super.initState();
    _connectivityStream = Connectivity().onConnectivityChanged;
    _checkConnectivity();
  }

  Future<void> _checkConnectivity() async {
    final result = await Connectivity().checkConnectivity();
    setState(() {
      _isConnected = result != ConnectivityResult.none;
    });
  }

  Future<void> _takePicture() async {
    setState(() {
      _loading = true;
    });

    final image = await ImagePicker().getImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      await _uploadImage();
    }

    setState(() {
      _loading = false;
    });
  }

  Future<void> _pickImage() async {
    setState(() {
      _loading = true;
    });

    final image = await ImagePicker().getImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      await _uploadImage();
    }

    setState(() {
      _loading = false;
    });
  }

  Future<void> _uploadImage() async {
    setState(() {
      _loading = true;
    });

    if (_image == null) {
      setState(() {
        _loading = false;
      });
      return; // No image to upload
    }

    final url = 'https://plant-uucd.onrender.com/predict';

    try {
      final dio = Dio();
      final formData = FormData.fromMap({
        'plant': 'Tomato',
        'file': await MultipartFile.fromFile(_image!.path),
      });
      final response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        final result = response.data;
        // Handle the response from the backend as needed
        print(result);
        // Navigate to ResultPage with the result
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ResultShowing(
                result['confidence'], result['disease'], result['solution']),
          ),
        );
      } else {
        print('Failed to upload image: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }

    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Image.asset(
              'Images/logoWhite.png',
              height: 100,
            ),
          ),
        ),
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
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _isConnected ? _takePicture : null,
                    style: ElevatedButton.styleFrom(
                      primary: bgColor,
                      minimumSize: Size(200, 80),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: _loading
                        ? CircularProgressIndicator() // Display loading indicator
                        : Container(
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
                  SizedBox(height: 10),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ElevatedButton(
                        onPressed: _isConnected ? _pickImage : null,
                        style: ElevatedButton.styleFrom(
                          primary: bgColor,
                          minimumSize: Size(240, 80),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: _loading
                            ? CircularProgressIndicator() // Display loading indicator
                            : Container(
                          width: 240,
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
                      if (!_isConnected)
                        Icon(
                          Icons.wifi_off,
                          size: 64,
                          color: Colors.red,
                        ),
                    ],
                  ),
                  SizedBox(height: 10),
                  StreamBuilder<ConnectivityResult>(
                    stream: _connectivityStream,
                    initialData: ConnectivityResult.none,
                    builder: (BuildContext context,
                        AsyncSnapshot<ConnectivityResult> snapshot) {
                      final isConnected =
                          snapshot.data != ConnectivityResult.none;
                      _isConnected = isConnected;

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            isConnected ? Icons.wifi : Icons.wifi_off,
                            color: isConnected ? Colors.green : Colors.red,
                            size: 24,
                          ),
                          SizedBox(width: 10),
                          Text(
                            isConnected
                                ? 'Connected to the internet'
                                : 'No internet connection',
                            style: TextStyle(
                              fontSize: 18,
                              color: isConnected ? Colors.green : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      );
                    },
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
