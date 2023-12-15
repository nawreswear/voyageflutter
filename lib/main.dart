import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:voyage/pages/contact.page.dart';
import 'package:voyage/pages/gallerie.page.dart';
import 'package:voyage/pages/inscription.page.dart';
import 'package:voyage/pages/meteo.page.dart';
import 'package:voyage/pages/parametres.page.dart';
import 'package:voyage/pages/pays.page.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'config/global.params.dart';
import 'firebase_options.dart';
import 'pages/autentification.page.dart';
import 'pages/home.page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  GlobalParams.themeActuiel.setMode(await getInitialMode());

  runApp(MyApp());
}

Future<String> getInitialMode() async {
  final snapshot = await FirebaseDatabase.instance.reference().child('mode').get();
  if (snapshot.exists) {
    return snapshot.value.toString();
  } else {
    return 'Jour';
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {'/home': (context) => HomePage(),
        '/inscription': (context) => InscriptionPage(),
        '/authentification': (context) => AuthentificationPage(),
        '/contact': (context) => ContactPage(),
        '/gallerie': (context) => GalleriePage(),
        '/meteo': (context) => MeteoPage(),
        '/parametres': (context) => ParametrePage(),
        '/pays': (context) => PaysPage()
      },
      theme: GlobalParams.themeActuiel.getTheme(),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return HomePage();
          } else {
            return AuthentificationPage();
          }
        },),);
  }

  @override
  void initState() {
    super.initState();
    GlobalParams.themeActuiel.addListener(() {
      setState(() {});
    });
  }
}

