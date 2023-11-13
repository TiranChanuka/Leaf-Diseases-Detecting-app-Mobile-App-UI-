import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class ScanPageCenterSinhala extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 55,
        ),
        Center(
          child: Image.asset(
              'Images/logo.png',
            width: 126,
            height: 76,
          ),
        ),
        SizedBox(height: 33,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'ගොවීන්ට ඔවුන්ගේ බෝග නීරෝගීව ',
              style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600
              ),
            )
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'පවත්වාගැනීමට සහය වෙමු',
              style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
              ),
            )
          ],
        ),
      ],
      
    );
  }
}