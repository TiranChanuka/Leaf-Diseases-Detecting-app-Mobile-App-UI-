import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/Screens/HomeScreen.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:plant_app/Widgets/BackgroundImg.dart';
import 'package:plant_app/Widgets/BackgroundImgOverlay.dart';

class FeedbackPage extends StatefulWidget {
  @override
  _FeedbackPageState createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
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
          MaterialPageRoute(builder: (context) => HomeScreen()),
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
                    "To help us serve you better and enhance our services, we kindly request your feedback. Your thoughts and opinions are invaluable to us and will contribute to making our app and services even better.",
                    style:GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Text(
                  "Rate your experience",
                    style:GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    )
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: RatingBar.builder(
                  initialRating: 2.5,
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
                    print(rating);
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
                    hintText: 'Enter your Name...',
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
                      _name = value;
                    });
                  },
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: 'Enter your Feedback...',
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
                onPressed: (){},
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
                      'Submit',
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
          // Padding(
          //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //   child: SizedBox(
          //     height: 900,
          //     child: Padding(
          //       padding:
          //           const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          //       child: ListView(
          //         children: [
          //           Text(
          //             '\nTo help us serve you better and enhance our services, we kindly request your feedback. Your thoughts and opinions are invaluable to us and will contribute to making our products and services even better.\n\n',
          //             style: TextStyle(color: Colors.white, fontSize: 16),
          //           ),
          //           Text(
          //             'Rate your experience:',
          //             style: TextStyle(
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.white),
          //           ),
          //           SizedBox(height: 50),
          //           Slider(
          //             value: _rating,
          //             onChanged: (value) {
          //               setState(() {
          //                 _rating = value;
          //               });
          //             },
          //             min: 0,
          //             max: 5,
          //             divisions: 5,
          //             label: 'Rating: $_rating',
          //             activeColor: bgColor,
          //           ),
          //           SizedBox(height: 50),
          //           Text(
          //             'Feedback:',
          //             style: TextStyle(
          //                 fontSize: 22,
          //                 fontWeight: FontWeight.bold,
          //                 color: Colors.white),
          //           ),
          //           SizedBox(height: 30),
          //           TextField(
          //             onChanged: (value) {
          //               setState(() {
          //                 _name = value;
          //               });
          //             },
          //             maxLines: 1,
          //             decoration: InputDecoration(
          //               hintText: 'Enter your Name...',
          //               border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(10)),
          //               fillColor: Colors.white,
          //               filled: true,
          //             ),
          //           ),
          //           SizedBox(height: 10),
          //           TextField(
          //             onChanged: (value) {
          //               setState(() {
          //                 _feedbackText = value;
          //               });
          //             },
          //             maxLines: 5,
          //             decoration: InputDecoration(
          //               hintText: 'Enter your feedback here...',
          //               border: OutlineInputBorder(
          //                   borderRadius: BorderRadius.circular(10)),
          //               fillColor: Colors.white,
          //               filled: true,
          //             ),
          //           ),
          //           SizedBox(height: 50),
          //           TextButton(
          //             onPressed: () {
          //               // Send feedback to the server or process it as needed
          //               // For now, just print the feedback and rating
          //               feedbackSend();
          //               print('Rating: $_rating');
          //               print('Feedback: $_feedbackText');
          //             },
          //             style: ButtonStyle(
          //               shape:
          //                   MaterialStateProperty.all<RoundedRectangleBorder>(
          //                 RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(10),
          //                 ),
          //               ),
          //               backgroundColor:
          //                   MaterialStateProperty.all<Color>(bgColor),
          //               foregroundColor:
          //                   MaterialStateProperty.all<Color>(Colors.white),
          //             ),
          //             child: Container(
          //               padding:
          //                   EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          //               child: Text(
          //                 'Submit Feedback',
          //                 style: TextStyle(
          //                     fontSize: 16, fontWeight: FontWeight.bold),
          //               ),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
