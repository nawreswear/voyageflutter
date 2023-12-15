
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthentificationPage extends StatelessWidget {
  late SharedPreferences prefs;
  TextEditingController text_login= new TextEditingController();
  TextEditingController text_password= new TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text(' autentification',style: TextStyle(fontStyle: FontStyle.italic, )),
          backgroundColor: Colors.purpleAccent,
          centerTitle: true,
        ),
        body:
        Container(
          color: Colors.purpleAccent[100],

          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                child: TextFormField(
                  controller: text_login,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.abc_rounded, color: Colors.purple),
                    hintText: "Identifiant",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 1),
                        borderRadius:BorderRadius.circular(10)
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
                    prefixIcon: Icon(Icons.password_outlined, color: Colors.purple),
                    hintText: "Mote de passe",
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 2, color: Colors.black26),
                        borderRadius:BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Container(
                  child: ElevatedButton(
                      style:ElevatedButton.styleFrom(
                          minimumSize:const Size.fromHeight(40),
                        primary: Colors.purpleAccent,
                      ),
                      onPressed:(){
                        _authentifer(context);
                      },
                      child:
                      Text('Connexion',style: TextStyle(fontSize: 22,color: Colors.white), ))),
              Container(
                child:TextButton(
                    child:Text('Jai n est pas un compte',style: TextStyle(fontSize: 20,color: Colors.white,)),
                    onPressed:(){
                      Navigator.pop(context);
                      Navigator.pushNamed(context,'/inscription');}),
              ) ],
          ),
        )
    );
  }

  Future<void> _authentifer(BuildContext context) async {
    prefs = await SharedPreferences.getInstance();
    String storedLogin = prefs.getString("login") ?? ""; // Get   login
    String storedPassword = prefs.getString("password") ?? ""; // Get   password

    if (text_login.text.isNotEmpty && text_password.text.isNotEmpty) {
      if (text_login.text == storedLogin && text_password.text == storedPassword) {
        prefs.setBool('connecte', true);
        Navigator.pop(context);
        Navigator.pushNamed(context, '/home');
      } else {
        const snackBar = SnackBar(
          content: Text('Identifiant ou mot de passe incorrects'),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    } else {
      const snackBar = SnackBar(
        content: Text('Identifiant ou mot de passe vide'),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

}