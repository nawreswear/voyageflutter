import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';
class InscriptionPage extends StatelessWidget {
  //late SharedPreferences prefs;
  TextEditingController text_login = new TextEditingController();
  TextEditingController text_password = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' d\'inscription', style: TextStyle(fontStyle: FontStyle.italic,),),
        backgroundColor: Colors.purpleAccent,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.purpleAccent[100],
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: text_login,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.perm_identity, color: Colors.purple),
                  hintText: "Identifiant",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: TextFormField(
                controller: text_password,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.ac_unit, color: Colors.purple),
                  hintText: "Mot de passe",
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(50),
                  primary: Colors.purpleAccent,
                ),
                onPressed: () {
                  _onInscrire(context);
                },
                child: Text(
                  'Inscription',
                  style: TextStyle(fontSize: 22),
                ),
              ),
            ),
            Container(
              child: TextButton(
                child: Text(
                  "J'ai déjà un compte",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/authentification');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _onInscrire(BuildContext context) async {
    if (text_login.text.isNotEmpty && text_password.text.isNotEmpty) {
      try {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: text_login.text.trim(),
          password: text_password.text.trim(),
        );
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      } on FirebaseAuthException catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              e.code == 'weak-password'
                  ? 'Mot de passe faible'
                  : e.code == 'email-already-in-use'
                  ? 'Email déjà existant'
                  : 'Erreur lors de l\'inscription',
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Identifiant ou mot de passe vides'),
        ),
      );
    }
  }
}
