import 'package:flutter/material.dart';
import 'package:medmotion/components/prescrip_button.dart';
//import 'package:medmotion/screens/login_screen.dart';
import 'package:medmotion/screens/newprescrip.dart';

class Receitas extends StatelessWidget {
  const Receitas({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF1E53BD),
            title: Center(child: Text('Receitas')),
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                PrescripButton(
                  text: "Nova Receita",
                  widthButton: MediaQuery.of(context).size.width * 0.3,
                  nextScreen: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => NewPrescription())),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
