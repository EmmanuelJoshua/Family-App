import 'package:flutter/material.dart';
import 'package:familyapp/theme.dart';
import 'package:familyapp/ui/landingpage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Family Community',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: primaryColor
      ),
      home: LandingPage()
    );
  }
}