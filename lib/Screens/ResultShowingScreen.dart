import 'package:flutter/material.dart';
import 'package:plant_app/Colors.dart';

class ResultShowing extends StatefulWidget {
  final double confidence;
  final String disease;
  final String solution;

  const ResultShowing(this.confidence, this.disease, this.solution);

  @override
  _ResultShowingState createState() => _ResultShowingState();
}

class _ResultShowingState extends State<ResultShowing> {
  bool _showPopup = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        _showPopup = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: _showPopup
                ? _buildMenuSection(
                context, widget.confidence, widget.disease, widget.solution)
                : Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection(
      BuildContext context, double confidence, String disease, String solution) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Container(
                  width: 60,
                  height: 6,
                  decoration: BoxDecoration(
                      color: bgColor, borderRadius: BorderRadius.circular(3)),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                '\n$disease',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    '\n$solution\n',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ResultShowing(0.9, 'Disease Name', 'Long description goes here.'),
  ));
}
