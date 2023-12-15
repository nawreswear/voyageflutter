import 'package:flutter/material.dart';
import '../notifier/theme.dart';
class GlobalParams{
  static List<Map<String,dynamic>>menus=[
  { "title":'Accueil', 'icon':Icon(Icons.home,color: Colors.purpleAccent),"route":"/home"},
    { "title":'Météo', 'icon':Icon(Icons.sunny,color: Colors.purpleAccent),"route":"/meteo"},
    { "title":'Gallerie','icon':Icon(Icons.image,color: Colors.purpleAccent),"route":"/gallerie"},
    { "title":'Pays', 'icon':Icon(Icons.countertops,color: Colors.purpleAccent),"route":"/pays"},
    { "title":'Contact','icon':Icon(Icons.contact_emergency_outlined,color: Colors.purpleAccent),"route":"/contact"},
    { "title":'Paramétres', 'icon':Icon(Icons.settings_accessibility,color: Colors.purpleAccent),"route":"/parametres"},
    { "title":'Déconnexion', 'icon': Icon(Icons.outbond_outlined,color: Colors.purpleAccent),"route":"/authentification"}
  ];
  static List<Map<String,dynamic>>accuiel=[
    {"image":'images/meteo.png',"route":"/meteo"},
    {"image":'images/gallerie.png',"route":"/gallerie"},
    {"image":'images/pays.png',"route":"/pays"},
    {"image":'images/contact.png',"route":"/contact"},
    {"image":'images/parametres.png',"route":"/parametres"},
    {"image":'images/deconnexion.png',"route":"/authentification"},
];
  static MonTheme themeActuiel=MonTheme();
}