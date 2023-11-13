import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/ScanScreens/ScanPageCones.dart';
import 'package:plant_app/ScanScreens/ScanPageGrapes.dart';
import 'package:plant_app/ScanScreens/ScanPagePotato.dart';
import 'package:plant_app/ScanScreens/ScanPageTea.dart';
import 'package:plant_app/Screens/SideMenu.dart';
import 'package:plant_app/ScanScreens/ScanPageSugarCane.dart';
import 'package:plant_app/Sinhala/Screens/HomeScreen.dart';
import '../ScanScreens/ScanPageTomato.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
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
                    'Identify Crop',
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
                    'Diseases',
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
                    'Select Plant',
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
                           return ImagePickerPageTomato();
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
                               "Tomato Leaf",
                               style:GoogleFonts.poppins(
                                   fontSize: 15,
                                   fontWeight: FontWeight.w600,
                             ),
                             ),
                             Text(
                               "Identifier",
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
                           return ImagePickerPagePotato();
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
                               "Potato Leaf",
                               style:GoogleFonts.poppins(
                                 fontSize: 16,
                                 fontWeight: FontWeight.w600,
                               ),
                             ),
                             Text(
                               "Identifier",
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
                            return ImagePickerPageGrapes();
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
                                "Grapes Leaf",
                                style:GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Identifier",
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
                            return ImagePickerPageTea();
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
                                "Tea Leaf",
                                style:GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Identifier",
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
                            return ImagePickerPageCones();
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
                                "Corn Leaf",
                                style:GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Identifier",
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
                            return ImagePickerPageSugarCane();
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
                                "Sugarcane Leaf",
                                style:GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                "Identifier",
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
