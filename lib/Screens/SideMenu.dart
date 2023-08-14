import 'package:flutter/material.dart';
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
              'AGRIO',
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            accountEmail: Text(''),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill, image: AssetImage('Images/SImg.png')),
            ),
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.cloudy_snowing,
          //     color: bgColor,
          //     size: 26,
          //   ),
          //   title: Text('Weather & Others'),
          //   onTap: () => {
          //     Navigator.push(
          //       context,
          //       MaterialPageRoute(builder: (context) => AboutUs()),
          //     ),
          //   },
          // ),
          // Divider(
          //   thickness: 2,
          //   height: 5,
          //   indent: 30,
          //   endIndent: 30,
          // ),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: bgColor,
              size: 26,
            ),
            title: Text('About Us'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AboutUs()),
              ),
            },
          ),
          Divider(
            thickness: 2,
            height: 5,
            indent: 30,
            endIndent: 30,
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: bgColor,
              size: 26,
            ),
            title: Text('Feedback & Rate'),
            onTap: () => {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FeedbackPage()),
              ),
            },
          ),
          Divider(
            thickness: 2,
            height: 5,
            indent: 30,
            endIndent: 30,
          ),
          ListTile(
            leading: Icon(
              Icons.share,
              color: bgColor,
              size: 26,
            ),
            title: Text('Share'),
            onTap: () => null,
          ),
          Divider(
            thickness: 2,
            height: 5,
            indent: 30,
            endIndent: 30,
          ),
          ListTile(
            leading: Icon(
              Icons.star_rate,
              color: bgColor,
              size: 26,
            ),
            title: Text(
              'Our Rating',
            ),
            onTap: ()=>{
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OurRating()),
              ),
            },
          ),
          Divider(
            thickness: 2,
            height: 5,
            indent: 30,
            endIndent: 30,
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: bgColor,
              size: 26,
            ),
            title: Text('Settings'),
            onTap: () => null,
          ),
          Divider(
            thickness: 2,
            height: 5,
            indent: 30,
            endIndent: 30,
          ),
          ListTile(
            title: Text('Exit'),
            leading: Icon(
              Icons.exit_to_app,
              color: bgColor,
              size: 26,
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
