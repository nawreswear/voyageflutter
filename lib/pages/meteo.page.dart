import 'package:flutter/material.dart';
import 'Meteo Details.dart';
import 'home.page.dart';

class MeteoPage extends StatelessWidget {
  TextEditingController txt_ville = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meteo',
        ),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent,
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

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: txt_ville,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.holiday_village_rounded,
                  color: Colors.purpleAccent,
                ),
                hintText: "Ville",
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                minimumSize: const Size.fromHeight(50),
                primary: Colors.purpleAccent,),
              onPressed: () {
                _onGetMeteoDetails(context);
              },
              child: Text('Recherche', style: TextStyle(fontSize: 22),
               ),

            ),
          ],
        ),
      ),
    );
  }

  void _onGetMeteoDetails(BuildContext context) {
    String v = txt_ville.text;
      Navigator.push(context, MaterialPageRoute(
        builder: (context) => MeteoDetailsPage(v)));
        txt_ville.text = '';
  }
}