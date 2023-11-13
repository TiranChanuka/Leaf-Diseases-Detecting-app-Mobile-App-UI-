import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/ScanScreens/ScanPageCones.dart';
import 'package:plant_app/Screens/HomeScreen.dart';
import 'package:plant_app/ScanScreens/ScanPageSugarCane.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/Sinhala/ScanScreens/ScanPageCones.dart';
import 'package:plant_app/Sinhala/ScanScreens/ScanPageGrapes.dart';
import 'package:plant_app/Sinhala/ScanScreens/ScanPagePotato.dart';
import 'package:plant_app/Sinhala/ScanScreens/ScanPageSugarCane.dart';
import 'package:plant_app/Sinhala/ScanScreens/ScanPageTea.dart';
import 'package:plant_app/Sinhala/ScanScreens/ScanPageTomato.dart';
import 'package:plant_app/Sinhala/Screens/SideMenu.dart';

class HomeScreenSinhala extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBarSinhala (),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(''),
        backgroundColor: wColor,
        elevation: 0, // No shadow
        actions: <Widget>[
          PopupMenuButton<String>(
            icon: Icon(Icons.language, color: Colors.black), // Customize the language icon
            onSelected: (value) {
              // Handle language selection here
              if (value == 'English') {
                // Set the app's language to English
              } else if (value == 'Sinhala') {
                // Set the app's language to Spanish
              }
            },
            itemBuilder: (BuildContext context) {
              return <PopupMenuEntry<String>>[
                PopupMenuItem<String>(
                  value: 'english',
                  child: ListTile(
                    title: Text('English',
                      style:GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ) ,),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      ),
                    },
                  ),
                ),
                PopupMenuItem<String>(
                  value: 'sinhala',
                  child: ListTile(
                    title: Text('සිංහල',
                      style:GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ) ,),
                    onTap: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreenSinhala()),
                      ),
                    },
                  ),
                ),
                // Add more language options as needed
              ];
            },
          ),
        ],
      ),
        body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'බෝගවල රෝග',
                    style:GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.w600,
                    ) ,
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'හඳුනාගනිමු',
                    style:GoogleFonts.poppins(
                      fontSize: 28,
                    ) ,
                  ),
                ],
              ),
              SizedBox(height: 30,),
              Container(
                width: MediaQuery.of(context).size.width * 0.95,
                child: Image.asset(
                  'Images/hero.png',
                  fit: BoxFit.contain, // Use BoxFit.contain to fit the image within the container
                ),
              ),
              SizedBox(height: 25,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'භෝග වර්ගයක් තෝරන්න',
                    style:GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: bgColor
                    ) ,
                  ),
                ],
              ),
             SizedBox(height: 36,),
             Row(
               mainAxisAlignment: MainAxisAlignment.center,
               children: [
                 Container(
                   width: MediaQuery.of(context).size.width * 0.455,
                   child: GestureDetector(
                     onTap: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) {
                           return ImagePickerPageTomatoSinhala();
                         }),
                       );
                     },
                     child: Card(
                       elevation: 0,
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(22),
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           children: <Widget>[
                             Container(
                               color: Color(0xFFF4F4F4), // Background color
                               padding: EdgeInsets.all(8),
                               child: Image.asset(
                                 'Images/PlantFront/tomatofront.png',
                                 height: 160.0,
                                 width: 160.0,
                               ),
                             ),
                             Text(
                               "තක්කාලි පත්‍ර",
                               style:GoogleFonts.poppins(
                                   fontSize: 15,
                                   fontWeight: FontWeight.w600,
                             ),
                             ),
                             Text(
                               "හඳුනාගැනීම",
                               style:GoogleFonts.poppins(
                                 fontSize: 10,
                                 fontWeight: FontWeight.w400,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),

                 SizedBox(width: 5,),
                 Container(
                   width: MediaQuery.of(context).size.width * 0.455,
                   child: GestureDetector(
                     onTap: () {
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) {
                           return ImagePickerPagePotatoSinhala();
                         }),
                       );
                     },
                     child: Card(
                       elevation: 0,
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(22),
                         child: Column(
                           mainAxisSize: MainAxisSize.min,
                           children: <Widget>[
                             Container(
                               color: Color(0xFFF4F4F4), // Background color
                               padding: EdgeInsets.all(8),
                               child: Image.asset(
                                 'Images/PlantFront/potatofront.png',
                                 height: 160.0,
                                 width: 160.0,
                               ),
                             ),
                             Text(
                               "අල පත්‍ර",
                               style:GoogleFonts.poppins(
                                 fontSize: 16,
                                 fontWeight: FontWeight.w600,
                               ),
                             ),
                             Text(
                               "හඳුනාගැනීම",
                               style:GoogleFonts.poppins(
                                 fontSize: 10,
                                 fontWeight: FontWeight.w400,
                               ),
                             ),
                           ],
                         ),
                       ),
                     ),
                   ),
                 ),
               ],
             ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.455,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ImagePickerPageGrapesSinhala();
                          }),
                        );
                      },
                      child: Card(
                        elevation: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                color: Color(0xFFF4F4F4), // Background color
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  'Images/PlantFront/grapesfront.png',
                                  height: 160.0,
                                  width: 160.0,
                                ),
                              ),
                              Text(
                                "මිදි පත්‍ර",
                                style:GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "හඳුනාගැනීම",
                                style:GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.455,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the new page when the Card is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ImagePickerPageTeaSinhala();
                          }),
                        );
                      },
                      child: Card(
                        elevation: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                color: Color(0xFFF4F4F4), // Background color
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  'Images/PlantFront/teafront.png',
                                  height: 160.0,
                                  width: 160.0,
                                ),
                              ),
                              Text(
                                "තේ පත්‍ර",
                                style:GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "හඳුනාගැනීම",
                                style:GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
              SizedBox(height: 5,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.455,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the new page when the Card is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ImagePickerPageConesSinhala();
                          }),
                        );
                      },
                      child: Card(
                        elevation: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                color: Color(0xFFF4F4F4), // Background color
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  'Images/PlantFront/cornfront.png',
                                  height: 160.0,
                                  width: 160.0,
                                ),
                              ),
                              Text(
                                "බඩ ඉරිඟු පත්‍ර",
                                style:GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "හඳුනාගැනීම",
                                style:GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 5,),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.455,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to the new page when the Card is tapped
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            return ImagePickerPageSugarCaneSinhala();
                          }),
                        );
                      },
                      child: Card(
                        elevation: 0,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(22),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Container(
                                color: Color(0xFFF4F4F4), // Background color
                                padding: EdgeInsets.all(8),
                                child: Image.asset(
                                  'Images/PlantFront/sugarcanefront.png',
                                  height: 160.0,
                                  width: 160.0,
                                ),
                              ),
                              Text(
                                "උක් පත්‍ර",
                                style:GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "හඳුනාගැනීම",
                                style:GoogleFonts.poppins(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                ],
              ),
            ],
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child:
          //   ),
          // ),
        ],
      ),
    );
  }

}
