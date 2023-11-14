import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:plant_app/Colors.dart';
import 'package:plant_app/Screens/AboutUs.dart';
import 'package:plant_app/Screens/Feedback.dart';
import 'package:plant_app/Screens/OurRatingScreen.dart';
import 'package:plant_app/Sinhala/Screens/AboutUs.dart';
import 'package:plant_app/Sinhala/Screens/Feedback.dart';

class NavBarSinhala extends StatelessWidget {
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
            title: Text('අපි ගැන',
              style:GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
              ) ,),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUsSinhala()),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.feedback_outlined,
              size: 22,
            ),
            title: Text('ප්‍රතිචාර ලබාදීම',
              style:GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
              ) ,),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPageSinhala()),
              ),
            },
          ),
          ListTile(
            leading: Icon(
              Icons.star_border_outlined,
              size: 22,
            ),
            title: Text('ලැබුන ප්‍රතිචාර',
              style:GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w400,
              ) ,),
            onTap: ()=>{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context)=>OurRating())
              ),
            },
          ),
          ListTile(
            title: Text('ඉවත්වීම',
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
