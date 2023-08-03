import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/Widgets/BackgroundImg.dart';
import 'package:plant_app/Widgets/BackgroundImgOverlay.dart';

class UserFeedback {
  final String name;
  final double rating;
  final String feedback;

  UserFeedback({required this.name, required this.rating, required this.feedback});
}

class OurRating extends StatelessWidget {
  final List<UserFeedback> userFeedbackList = [
    UserFeedback(name: 'John Doe', rating: 4.5, feedback: 'Great app! Very user-friendly.'),
    UserFeedback(name: 'John Doe', rating: 4.5, feedback: 'Great app! Very user-friendly.'),
    UserFeedback(name: 'John Doe', rating: 4.5, feedback: 'Great app! Very user-friendly.'),
    UserFeedback(name: 'John Doe', rating: 4.5, feedback: 'Great app! Very user-friendly.'),
    UserFeedback(name: 'John Doe', rating: 4.5, feedback: 'Great app! Very user-friendly.'),
    UserFeedback(name: 'John Doe', rating: 4.5, feedback: 'Great app! Very user-friendly.'),

    UserFeedback(name: 'Jane Smith', rating: 5, feedback: 'Awesome experience. Highly recommended!'),
    // Add more user feedback data here
  ];

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
          ListView.builder(
            itemCount: userFeedbackList.length,
            itemBuilder: (context, index) {
              UserFeedback userFeedback = userFeedbackList[index];
              return Container(
                decoration: BoxDecoration(
                  color: fbColor.withOpacity(0.18),
                  border: Border.all(color: sideMenuColor, width: 1),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.all(25.0), // Padding added to the Container
                margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage('Images/user.png',),
                    radius: 40.0,
                  ),
                  title: Text(userFeedback.name,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.star, color: Colors.orange),
                          Text('${userFeedback.rating} / 5',style: TextStyle(color: Colors.white),),
                        ],
                      ),
                      SizedBox(height: 5),
                      Text(userFeedback.feedback,style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
