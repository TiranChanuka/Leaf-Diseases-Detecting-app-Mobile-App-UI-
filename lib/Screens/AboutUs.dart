import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/Widgets/BackgroundImg.dart';
import 'package:plant_app/Widgets/BackgroundImgOverlay.dart';

class AboutUs extends StatelessWidget {
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
        ),
      ),
      body: ListView(
        children: [
          Column(
            children: [
              SizedBox(height: 20,),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Image.asset(
                  'Images/aboutUs.png',
                  fit: BoxFit.contain, // Use BoxFit.contain to fit the image within the container
                ),
              ),
              SizedBox(height: 30,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 35,),
              child: Text(
                  "Welcome to the agrio mobile app - your CNN-Based solution for detecting ans identifying plant diseases in real-time !",
                  style:GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                  )
              ),
              ),
              SizedBox(height: 30,),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 35,),
                child: Text(
                    "At agrio, we are on a mission to revolution agriculture through cutting-edge technology. Our mobile application leverage the power of convolutional neural network (CNN) to detect and identifies plant disease using real time images of plant.",
                    style:GoogleFonts.poppins(
                      fontSize: 15,
                      fontWeight: FontWeight.w400,
                    )
                ),
              ),
              SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                  minimumSize: Size(344, 90),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Container(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Contact Number',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: bgColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 1), // Add left margin
                                Text(
                                  '011-234-5678',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.add_ic_call_outlined, size: 30),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 18),
              ElevatedButton(
                onPressed: (){},
                style: ElevatedButton.styleFrom(
                  primary: buttonColor,
                  minimumSize: Size(344, 90),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Container(
                  width: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Email',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: bgColor,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SizedBox(width: 1), // Add left margin
                                Text(
                                  'agriohelps@agrio.com',
                                  style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Icon(Icons.email_outlined, size: 30),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      )
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
