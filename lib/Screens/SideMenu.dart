import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/Screens/AboutUs.dart';
import 'package:plant_app/Screens/Feedback.dart';
import 'package:plant_app/Screens/OurRatingScreen.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      // backgroundColor: sideMenuColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              '',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(''),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('Images/SImg.png'),),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.favorite_outline_rounded,
              size: 22,
            ),
            title: Text('about',
              style:GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
              ) ,),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUs()),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.feedback_outlined,
              size: 22,
            ),
            title: Text('Feedback & Rate',
              style:GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
              ) ,),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPage()),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.star_border_outlined,
              size: 22,
            ),
            title: Text('Share',
              style:GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ) ,),
            onTap: ()=>{
              Navigator.pop(context),
            },
          ),
          ListTile(
            title: Text('Exit',
                style:GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                )),
            leading: Icon(
              Icons.exit_to_app_rounded,
              size: 22,
            ),
            onTap: () => {
            Navigator.pop(context),
            },
          ),
        ],
      ),
    );
  }
}
