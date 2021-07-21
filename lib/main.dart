import 'package:flutter/material.dart';
import 'package:medmotion/screens/home_screen.dart';

void main() {
  runApp(MedmotionApp());
}

class MedmotionApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medmotion',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.blue,
        primarySwatch: Colors.blue,
        fontFamily: 'Poppins-Regular', //GoogleFonts.poppins().fontFamily,
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: Colors.teal[300],
            primary: Colors.white,
          ),
        ),
      ),
      home: HomeScreen(),
    );
  }
}
