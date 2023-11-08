import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/Widgets/BackgroundImg.dart';
import 'package:plant_app/Widgets/BackgroundImgOverlay.dart';

class ResultShowing extends StatelessWidget {
  final double confidence;
  final String disease;
  final String solution;

  ResultShowing(this.confidence, this.disease, this.solution);

  void _showPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: _buildMenuSection(context, confidence, disease, solution),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(''),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      //   centerTitle: true,
      //   leading: IconButton(
      //     icon: Icon(Icons.arrow_back_ios_new),
      //     color: Colors.black,
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {
                  _showPopup(context);
                },
                child: Text('Show Popup'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(BuildContext context, double confidence, String disease, String solution) {
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
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: Container(
                width: 60,
                height: 6,
                decoration: BoxDecoration(
                    color: bgColor, borderRadius: BorderRadius.circular(3)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              '\n$disease',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              height: 200,
              child: SingleChildScrollView(
                child: Text(
                  '\n$solution\n',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.w400,
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
