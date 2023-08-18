import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/Widgets/BackgroundImg.dart';
import 'package:plant_app/Widgets/BackgroundImgOverlay.dart';

class AboutUs extends StatelessWidget {
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
      body: Stack(
        children: [
          BackgroundImg(),
          BackgoundImgOverlay(),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 100),
            child: Text(
              "About Us",
              style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 135),
            child: Text(
              'Welcome to the Agrio Mobile App - Your CNN-Based Solution for Detecting and Identifying Plant Diseases in Real-Time!\nAt Agrio, we are on a mission to revolutionize agriculture through cutting-edge technology. Our mobile application leverages the power of Convolutional Neural Networks (CNNs) to detect and identify plant diseases using real-time images of plants. Plant diseases pose a significant threat to agricultural productivity, impacting both quality and quantity.',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            right: 16,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ContactInfoBox(
                  title: 'Phone Number',
                  info: '011-456-7890',
                  icon: Icons.phone,

                ),
                ContactInfoBox(
                  title: 'Email',
                  info: 'agriohelps@agrio.com',
                  icon: Icons.email,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactInfoBox extends StatelessWidget {
  final String title;
  final String info;
  final IconData icon;


  ContactInfoBox({required this.title, required this.info, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Icon(icon, color: bgColor, size: 40),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 4),
          Text(
            info,
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
