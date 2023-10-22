import 'package:flutter/material.dart';
import './HomeScreen.dart';

class PlantLandingPage extends StatefulWidget {
  @override
  _PlantLandingPageState createState() => _PlantLandingPageState();
}

class _PlantLandingPageState extends State<PlantLandingPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to HomeScreen when tapped
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'Images/logo.png',
                      width: 200,
                      height: 200,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.all(16),
              child: Text(
                'Version 2.0',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
