import 'package:flutter/material.dart';

import 'package:medmotion/screens/perguntas_screen.dart';
import 'package:medmotion/screens/receitas.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  final List<Widget> telas = [
    Perguntas(),
    NewPageScreen("Conversar"),
    Receitas(),
    NewPageScreen("Perfil"),
  ];

  setIndex(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: telas.elementAt(selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: setIndex,
        showUnselectedLabels: true,
        selectedItemColor: Colors.teal,
        unselectedItemColor: Colors.blue[700],
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: "Perguntas",
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sms),
            label: "Conversar",
            //   backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.assignment),
            label: "Receitas",
            //   backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Perfil",
            //   backgroundColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}

class NewPageScreen extends StatelessWidget {
  final String texto;

  NewPageScreen(this.texto);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(texto),
      ),
    );
  }
}