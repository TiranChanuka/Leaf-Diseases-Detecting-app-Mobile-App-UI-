import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';

class NavBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: sideMenuColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text('AGRIO',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            accountEmail: Text(''),
            decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('Images/back.jpg')),
            ),
          ),
          ListTile(
            leading: Icon(Icons.favorite),
            title: Text('About Us'),
            onTap: () => null,
          ),
          Divider(
            thickness: 2,
            height: 5,
            indent: 30,
            endIndent: 30,
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Feedback'),
            onTap: () => null,
          ),
          Divider(
            thickness: 2,
            height: 5,
            indent: 30,
            endIndent: 30,
          ),
          ListTile(
            leading: Icon(Icons.share),
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
            leading: Icon(Icons.star_rate),
            title: Text('Rate Us',),
          ),
          Divider(
            thickness: 2,
            height: 5,
            indent: 30,
            endIndent: 30,
          ),
          ListTile(
            leading: Icon(Icons.settings),
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
            leading: Icon(Icons.exit_to_app),
            onTap: () => null,
          ),
        ],
      ),
    );
  }
}