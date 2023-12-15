import 'package:flutter/material.dart';
import 'gallerie-details.Page.dart';
import 'home.page.dart';

class GalleriePage extends StatelessWidget {
  TextEditingController txt_cle = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gallerie '),
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
          }
        )
      ),


          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: txt_cle,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.image_search_sharp, color: Colors.purpleAccent,),
                    hintText: "clé recherché",
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
                    primary: Colors.purpleAccent,
                  ),
                  onPressed: () {
                    _onGetGalleryDetail(context);
                  },
                  child: Text('Recherche', style: TextStyle(fontSize: 22),
                  ),
                ),
              ],
            ),
          ),
        );
      }

      void _onGetGalleryDetail(BuildContext context) {
        String cle = txt_cle.text;
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => GallerieDetailsPage(cle: cle),),);
        txt_cle.text = '';
      }
    }