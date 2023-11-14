import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/Widgets/BackgroundImg.dart';
import 'package:plant_app/Widgets/BackgroundImgOverlay.dart';

class UserFeedback {
  final String name;
  final String rating;
  final String feedback;

  UserFeedback(
      {required this.name, required this.rating, required this.feedback});
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
    // final url = 'http://10.0.2.2:8000/feedbacks';
    final url = 'https://plant-uucd.onrender.com/feedbacks';
    try {
      final dio = Dio();
      final response = await dio.get(url);
      if (response.statusCode == 200) {
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
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(''),
        backgroundColor: wColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Image.asset(
                  'Images/ourRating.png',
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              for (UserFeedback userFeedback in userFeedbackList)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: bgColor, width: 1),
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(25.0),
                  margin: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(
                        'Images/user.png',
                      ),
                      radius: 40.0,
                    ),
                    title: Text(
                      userFeedback.name,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.star, color: bgColor),
                            Text(
                              '${userFeedback.rating} / 5.0',
                              style: GoogleFonts.poppins(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5),
                        Text(
                          userFeedback.feedback,
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),

        ],
      ),
    );
  }
}
