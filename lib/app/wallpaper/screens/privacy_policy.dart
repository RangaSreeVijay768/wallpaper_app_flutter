import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("About Us")),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "About the App",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "This app was designed and developed by [Your Name], a passionate developer who is dedicated to creating functional and user-friendly applications.",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Developer Details",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "Name: [Your Full Name]",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Mobile: [Your Mobile Number]",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Email: [Your Email Address]",
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              "Social Media",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              "LinkedIn: [Your LinkedIn Profile Link]",
              style: TextStyle(fontSize: 16),
            ),
            Text(
              "Portfolio: [Your Portfolio Link]",
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
