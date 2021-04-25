import 'package:flutter/material.dart';
import 'package:medmotion/components/custom_textfield.dart';
import 'package:medmotion/components/primary_button.dart';
import 'package:medmotion/components/profile_button.dart';
import 'package:medmotion/screens/login_screen.dart';
import 'package:medmotion/screens/sign_up_screen.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _nextLoginScreen() {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          // retorna um objeto do tipo Dialog
          return Dialog(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.4,
              padding: EdgeInsets.all(8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Email enviado com sucesso!",
                    style: TextStyle(
                      color: Color(0xFF1E53BD),
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  PrimaryButton(
                    text: "Fazer login",
                    nextScreen: () => Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LoginScreen())),
                    widthButton: MediaQuery.of(context).size.width * 0.6,
                  ),
                ],
              ),
            ),
          );
        },
      );
    }

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
