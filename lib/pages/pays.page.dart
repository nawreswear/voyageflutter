import 'package:flutter/material.dart';
import 'package:voyage/pages/home.page.dart';
class PaysPage extends StatelessWidget {
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text(' Pays',),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => HomePage(),
              ),
            );
          },
        ),
      ),
      body: Text(" Pays")
  );
}
}