import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medmotion/screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Medmotion',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: GoogleFonts.poppins().fontFamily,
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
