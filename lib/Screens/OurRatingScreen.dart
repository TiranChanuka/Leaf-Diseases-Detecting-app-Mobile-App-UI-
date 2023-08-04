import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/Widgets/BackgroundImg.dart';
import 'package:plant_app/Widgets/BackgroundImgOverlay.dart';

class UserFeedback {
  final String name;
  final String rating;
  final String feedback;

  UserFeedback({required this.name, required this.rating, required this.feedback});
}

class OurRating extends StatefulWidget {
  @override
  _OurRatingState createState() => _OurRatingState();
}

class _OurRatingState extends State<OurRating> {
  List<UserFeedback> userFeedbackList = [];

  @override
  void initState() {
    super.initState();
    fetchFeedbackData();
  }

  Future<void> fetchFeedbackData() async {
    final url = 'http://10.0.2.2:8000/feedbacks'; // Replace with your backend URL
    try {
      final dio = Dio();
      final response = await dio.get(url);
      if (response.statusCode == 200) {
        print(response);
        final feedbackData = response.data as List<dynamic>;
        setState(() {
          userFeedbackList = feedbackData.map((feedback) {
            return UserFeedback(
              name: feedback['name'],
              rating: feedback['rating'],
              feedback: feedback['feedback'],
            );
          }).toList();
        });
      } else {
        print('Failed to fetch feedback data: ${response.statusMessage}');
      }
    } catch (e) {
      print('Error occurred while fetching feedback data: $e');
    }
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
