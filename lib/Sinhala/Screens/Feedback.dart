import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/Screens/HomeScreen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:plant_app/Sinhala/Screens/HomeScreen.dart';


class FeedbackPageSinhala extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPageSinhala> {
  double _rating = 0.0;
  String _feedbackText = '';
  String _name='';

  String convertToStars(double rating) {
    int numberOfStars = rating.round();
    return '*' * numberOfStars;
  }

  Future<void> feedbackSend() async {
    if (_rating == 0 && _feedbackText == '') {
      return;
    }
    String stars = convertToStars(_rating);

    // final url = 'http://10.0.2.2:8000/feedback';
    final url = 'https://plant-uucd.onrender.com/feedback';
    print(_rating);
    print(_name);
    print(_feedbackText);
    try {
      final dio = Dio();
      final formData =
          FormData.fromMap({'rating': stars, 'name':_name, 'feedback': _feedbackText});
      final response = await dio.post(url, data: formData);
      if (response.statusCode == 200) {
        final result = response.data;
        // Handle the response from the backend as needed
        print(result);
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeScreenSinhala()),
        );
      } else {
        print('Failed to submit : ${response.statusMessage}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
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
        ), //  Add a back button icon
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Image.asset(
                  'Images/feedback.png',
                  fit: BoxFit.contain, // Use BoxFit.contain to fit the image within the container
                ),
              ),
              SizedBox(height: 30,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 35,),
                child: Text(
                    "ඔබට වඩා හොඳින් සේවය කිරීමට සහ අපගේ සේවාවන් වැඩිදියුණු කිරීමට අපට උදවු කිරීමට, අපි ඔබේ ප්‍රතිපෝෂණය කාරුණිකව ඉල්ලා සිටිමු. ඔබගේ අදහස් අපට අගනා වන අතර අපගේ යෙදුම සහ සේවාවන් වඩාත් යහපත් කිරීමට එය දායක වනු ඇත.",
                    style:GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Text(
                  "ඔබේ අත්දැකීම ශ්‍රේණිගත කරන්න",
                    style:GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: RatingBar.builder(
                  initialRating: 0,
                  minRating: 0,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star_rounded,
                    color: bgColor,
                  ),
                  onRatingUpdate: (rating) {
                    _rating = rating;
                  },
                ),
              ),
              SizedBox(height: 30),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: 'ඔබගේ නම ඇතුලත් කරන්න...',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: buttonColor),
                        borderRadius: BorderRadius.circular(18),),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 8),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _feedbackText = value;
                    });
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'ඔබගේ ප්‍රතිපෝෂණ ඇතුලත් කරන්න...',
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 2, color: buttonColor),
                        borderRadius: BorderRadius.circular(18),),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){
                  feedbackSend();
                },
                style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                  minimumSize: Size(344, 70),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Container(
                  width: 300,
                  child: Center(
                    child: Text(
                      'ඉදිරිපත් කරන්න',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: bgColor,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),
            ],
          )
        ],
      ),
    );
  }
}
