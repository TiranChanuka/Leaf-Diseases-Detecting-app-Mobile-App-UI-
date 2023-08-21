import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/ScanScreens/ScanPageCones.dart';
import 'package:plant_app/ScanScreens/ScanPageGrapes.dart';
import 'package:plant_app/ScanScreens/ScanPagePotato.dart';
import 'package:plant_app/ScanScreens/ScanPageTea.dart';
import 'package:plant_app/Screens/SideMenu.dart';
import 'package:plant_app/Widgets/BackgroundImg.dart';
import 'package:plant_app/ScanScreens/ScanPageSugarCane.dart';
import '../ScanScreens/ScanPageTomato.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.transparent, // Transparent app bar background
        elevation: 0, // No shadow
        centerTitle: true, // Center the logo
        flexibleSpace: Container(
          padding: EdgeInsets.only(top: 10),
          child: Center(
            child: Image.asset(
              'Images/logoWhite.png',
              height: 100,

              // width: 100,
            ),
          ),
        ),//  Add a back button icon
      ),
      body: Stack(
        children: [
          BackgroundImg(),
          _buildBlurOverlay(),
          // _buildTitle(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildMenuSection(context),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBlurOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.5),
    );
  }


  Future<void> _fetchHelloWorld() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/ping'));

    if (response.statusCode == 200) {
      final responseData = response.body;
      print(responseData);
      // You can parse the JSON response if needed, but for this example, we're printing the entire response.
    } else {
      print('Failed to fetch "Hello, World!"');
    }
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: 150,
        height: 150,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Images/logoWhite.png'), // Background image
          ),
        ),
      ),
    );
  }


  Widget _buildMenuSection(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        color: fbColor.withOpacity(0.18),
        border: Border.all(color: Colors.white, width: 0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(

        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '\nMenu Section\n',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Hey, welcome to Agrio! We are glad you are contacting us. For best results see a close-up view of the individual leaf. If you have any questions, please contact our friendly team who will be happy to assist you...!\n',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: 5),
              children: [
                _buildMenuIcon('Images/Plants/tomato.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImagePickerPageTomato()),
                  );
                }, 'Tomato', 'Description'),
                _buildMenuIcon('Images/Plants/potato.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImagePickerPagePotato()),
                  );
                }, 'Potato', 'Description'),
                _buildMenuIcon('Images/Plants/grapes.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImagePickerPageGrapes()),
                  );
                }, 'Grapes', 'Description'),
                _buildMenuIcon('Images/Plants/tea.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImagePickerPageTea()),
                  );
                }, 'Tea', 'Description'),
                _buildMenuIcon('Images/Plants/corn.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImagePickerPageCones()),
                  );
                }, 'Corn', 'Description'),
                _buildMenuIcon('Images/Plants/sugarcane.png', () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ImagePickerPageSugarCane()),
                  );
                }, 'Sugarcane', 'Description'),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuIcon(String imagePath,
      VoidCallback onTap,
      String title,
      String additionalText,) {
    return GestureDetector(
      onTap: onTap, // Use the provided onTap callback
      child: Container(
        margin: EdgeInsets.all(8),
        width: 100,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imagePath),
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

}
