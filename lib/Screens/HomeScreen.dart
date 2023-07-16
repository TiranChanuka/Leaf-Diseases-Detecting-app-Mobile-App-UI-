// import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildBlurOverlay(),
          _buildTitle(),
          _buildMenuSection(),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Images/back.jpg'), // Background image
          fit: BoxFit.cover,

        ),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
        child: Container(
          color: Colors.black.withOpacity(0.1),
        ),
      ),
    );
  }

  Widget _buildBlurOverlay() {
    return Container(
      color: Colors.black.withOpacity(0.5),
    );
  }

  Widget _buildTitle() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: 100),
        child: Text(
          'Welcome to My App',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }


  Widget _buildMenuSection() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 150,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 1),
          borderRadius: BorderRadius.circular(12),

        ),
        child: ListView(
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 16),
          children: [
            _buildMenuIcon('assets/icon1.png', () {
              // Add navigation logic for menu icon 1
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => Page1()),
              // );
            },'Menu 1', 'Description'),
            _buildMenuIcon('Images//Plants/potato.png', () {
              // Add navigation logic for menu icon 2
            },'Potato', 'Description'),
            _buildMenuIcon('assets/icon3.png', () {
              // Add navigation logic for menu icon 3
            },'Menu 1', 'Description'),
            _buildMenuIcon('assets/icon4.png', () {
              // Add navigation logic for menu icon 4
            },'Menu 1', 'Description'),
            _buildMenuIcon('assets/icon5.png', () {
              // Add navigation logic for menu icon 5
            },'Menu 1', 'Description'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuIcon(String imagePath, VoidCallback onTap, String title, String additionalText) {
    return GestureDetector(
      onTap: onTap,
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
