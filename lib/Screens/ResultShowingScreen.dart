import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';


class ResultShowing extends StatelessWidget {
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
            Navigator.pop(context); // This will navigate back to the previous screen
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
        ),//  Add a back button icon
      ),
      body: Stack(
        children: [
          _buildBackgroundImage(),
          _buildBlurOverlay(),
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
  Widget _buildMenuSection(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 450,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child:Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(3)

                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '\nBrown Leaf\n',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              'Solution :\nLorem ipsum dolor sit amet, consectetur adipiscing elit.rsus. Nunc vitae ligula ac ipsum semper sollicitudin. In sodales, sapien sit amet egestas luctus\n',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 15,),
              child: Container(
                width: 300,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: bgColor,
                ),
                child: Center(
                  child: Text(
                    '99.9 Accurate'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
