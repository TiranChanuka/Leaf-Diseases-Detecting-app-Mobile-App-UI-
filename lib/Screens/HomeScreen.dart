// import 'dart:js';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildBlurOverlay(),
          _buildTitle(),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _buildMenuSection(),
            ),
          )
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

  Widget _buildMenuSection() {
    return Container(
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        color: fbColor.withOpacity(0.18),
        // backgroundBlendMode: BlendMode.overlay,
        border: Border.all(color: Colors.white, width: 0.8),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // Align children to the left
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '\nMenu Section\n', // Your desired topic for the section
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
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed malesuada ex nec mauris faucibus, id ullamcorper ipsum cursus. Nunc vitae ligula ac ipsum semper sollicitudin. In sodales, sapien sit amet egestas luctus\nfelis nisl interdum ex, at rhoncus velit ligula ac velit. Vivamus eget fermentum ex.\n',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 5),
                children: [
                  _buildMenuIcon('Images/Plants/tomato.png', () {
                    // Add navigation logic for menu icon 1

                  }, 'Tomato', 'Description'),
                  _buildMenuIcon('Images/Plants/potato.png', () {
                    // Add navigation logic for menu icon 2
                  }, 'Potato', 'Description'),
                  _buildMenuIcon('Images/Plants/grapes.png', () {
                    // Add navigation logic for menu icon 3
                  }, 'Grapes', 'Description'),
                  _buildMenuIcon('assets/icon4.png', () {
                    // Add navigation logic for menu icon 4
                  }, 'Tea', 'Description'),
                  _buildMenuIcon('assets/icon5.png', () {
                    // Add navigation logic for menu icon 5
                  }, 'Cone', 'Description'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuIcon(String imagePath, VoidCallback onTap, String title,
      String additionalText) {
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
