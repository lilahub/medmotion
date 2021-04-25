import 'package:flutter/material.dart';
import 'package:medmotion/components/custom_textfield.dart';
import 'package:medmotion/components/primary_button.dart';
import 'package:medmotion/components/profile_button.dart';
import 'package:medmotion/screens/login_screen.dart';
import 'package:medmotion/screens/sign_up_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width * 0.05;
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding:
                  EdgeInsets.only(bottom: 40, left: padding, right: padding),
              child: Image.asset(
                "assets/logo1.png",
                fit: BoxFit.contain,
              ),
            ),
            ProfileButton(
              icon: Icons.settings,
              text: "Configurações da conta",
              padding: padding,
            ),
            ProfileButton(
              text: "Compartilhe sua experiência",
              padding: padding,
            ),
            ProfileButton(
              text: "Central de ajuda",
              padding: padding,
            ),
            ProfileButton(
              text: "Sobre nós",
              padding: padding,
            )
          ],
        ),
      ),
    );
  }
}
