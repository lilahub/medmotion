import 'package:flutter/material.dart';

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
            title: Text('Receitas'),
          ),
        ),
      ),
    );
  }
}
