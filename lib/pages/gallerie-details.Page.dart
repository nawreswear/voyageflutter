import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'gallerie.page.dart';

class GallerieDetailsPage extends StatefulWidget {
  final String cle;
//ou late SharedPreferences totalPage
  GallerieDetailsPage({required this.cle});

  @override
  _GallerieDetailsPageState createState() => _GallerieDetailsPageState(cle: cle);
}

class _GallerieDetailsPageState extends State<GallerieDetailsPage> {
  String cle;
  int currentPage = 1;
  int size = 10;
  List<dynamic> hits = [];
  var galleryData;
  late int totalPage = 0;
  ScrollController _scrollController = new ScrollController();

  _GallerieDetailsPageState({required this.cle});

  @override
  void initState() {
    super.initState();
    getGalleryData(widget.cle);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        if (currentPage < totalPage) {
          currentPage++;
          getGalleryData(widget.cle);
        }
      }
    });
  }

  void getGalleryData(String cle) async {
    String apiKey = '15646595-375eb91b3408e352760ee72c8';
    String url = 'https://pixabay.com/api/?key=$apiKey&q=$cle&page=$currentPage&per_page=$size';

    try {
      final resp = await http.get(Uri.parse(url));
      if (resp.statusCode == 200) {
        setState(() {
          this.galleryData = json.decode(resp.body);
          hits.addAll(galleryData['hits']);
          totalPage = (galleryData['totalHits'] / size).ceil();
        });
      } else {
        print('Échec de la requête HTTP : ${resp.reasonPhrase}');
      }
    } catch (error) {
      print('Erreur lors de la requête HTTP : $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: totalPage == 0
            ? Text('Pas de résultats')
            : Text("${widget.cle}, Page: ${currentPage}/${totalPage}"),
        backgroundColor: Colors.purpleAccent,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => GalleriePage(),
              ),
            );
          },
        ),
        ),
      body: galleryData == null
          ? Center(child: CircularProgressIndicator())
          : Container(
            child: ListView.builder(
                itemCount: (galleryData == null ? 0 : hits.length),
                controller: _scrollController,
                itemBuilder: (context, index) {
              final image = hits[index];
              final tags = image['tags'];
              return Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(5.0),
                    padding: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.purpleAccent,
                    ),
                    child: Center(
                      child: Text(
                        hits[index]['tags'],
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(5.0),
                    //padding: EdgeInsets.all(2.0),
                    child: Image.network(
                      hits[index]['webformatURL'],
                      fit: BoxFit.fitWidth,
                    ),
                  ),

                ],
              );
                },
            ),
      ),
    );
  }

@override
  void dispose() {//cycle de vie tfar8 memoire
    super.dispose();
    _scrollController.dispose();
  }
}
