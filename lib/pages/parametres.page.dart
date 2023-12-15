import 'package:flutter/material.dart';
import 'package:voyage/pages/home.page.dart';
import 'package:firebase_database/firebase_database.dart';

import '../config/global.params.dart';

String mode = "Jour";
FirebaseDatabase fire = FirebaseDatabase.instance;
DatabaseReference ref = fire.ref();
class ParametrePage extends StatefulWidget {
  @override
  State<ParametrePage> createState() => ParametrePageState();
}

class ParametrePageState  extends State<ParametrePage> {
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(' Parametre',),
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
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Mode', style: TextStyle(fontSize: 20)),
            ListTile(
              title: Text('Jour'),
              leading: Radio(
                value: 'Jour',
                groupValue: mode,
                onChanged: (value) {
                  setState(() {
                    mode = value.toString();
                    GlobalParams.themeActuiel.setMode(mode);
                  });
                },
              ),
            ),
            ListTile(
              title: Text('Nuit'),
              leading: Radio(
                value: 'Nuit',
                groupValue: mode,
                onChanged: (value) {
                  setState(() {
                    mode = value.toString();
                    GlobalParams.themeActuiel.setMode(mode);
                  });
                },
              ),
            ),
            ElevatedButton(
              onPressed: onSaveMode,
              child: Text('Enregistrer'),
            ),
          ],
        ),
    );
  }

  onSaveMode() async {
    await ref.set({"mode": mode});
    print("Mode changé");
    Navigator.pop(context);
  }
}