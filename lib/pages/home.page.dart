import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../config/global.params.dart';
import '../menu/drawer.widget.dart';

class HomePage extends StatelessWidget {
  late SharedPreferences prefs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text('d\'accueil',),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: GlobalParams.accuiel.length,
              itemBuilder: (BuildContext context, int index) {
                final item = GlobalParams.accuiel[index];
                return GestureDetector(
                  onTap: () async {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '${item['route']}');
                  },
                  child: Image.asset(item['image']),
                );
              },
            ),
          ),
          Container(
            color: Colors.purpleAccent[100],
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                primary: Colors.purpleAccent,
              ),
              onPressed: () {
                _Deconnexion(context);
              },
              child: Text(
                'Déconnexion',
                style: TextStyle(fontSize: 22, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _Deconnexion(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool('connecte', false);
    Navigator.pushNamedAndRemoveUntil(context, '/authentification', (route) => false);
  }
}
