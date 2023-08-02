import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/Widgets/BackgroundImg.dart';
import 'package:plant_app/Widgets/BackgroundImgOverlay.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  double _rating = 0.0;
  String _feedbackText = '';

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
            Navigator.pop(
                context); // This will navigate back to the previous screen
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
        ), //  Add a back button icon
      ),
      body: Stack(
        children: [
          BackgroundImg(),
          BackgoundImgOverlay(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: ListView(
              children: [
                Text('\nTo help us serve you better and enhance our services, we kindly request your feedback. Your thoughts and opinions are invaluable to us and will contribute to making our products and services even better.\n\n',
                style: TextStyle(color: Colors.white,fontSize: 16),),
                Text(
                  'Rate your experience:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                SizedBox(height: 50),
                Slider(
                  value: _rating,
                  onChanged: (value) {
                    setState(() {
                      _rating = value;
                    });
                  },
                  min: 0,
                  max: 5,
                  divisions: 5,
                  label: 'Rating: $_rating',
                  activeColor: bgColor,
                ),
                SizedBox(height: 50),
                Text(
                  'Feedback:',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold,color: Colors.white),
                ),
                SizedBox(height: 50),
                TextField(
                  onChanged: (value) {
                    setState(() {
                      _feedbackText = value;
                    });
                  },
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Enter your feedback here...',
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(height: 50),
                FlatButton(
                  onPressed: () {
                    // Send feedback to the server or process it as needed
                    // For now, just print the feedback and rating
                    print('Rating: $_rating');
                    print('Feedback: $_feedbackText');
                  },

                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: bgColor,
                  textColor: Colors.white,
                  child: Text('Submit Feedback',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
