// import the material standard library

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'image_model.dart';


///  define app class that extends *StatelessWidgets*
class App extends StatefulWidget {
  AppState createState() {
    return AppState();
  }
}

class AppState extends State<App> {
  int counter = 0;
  List<ImageModel> imageList = [];

  ///  Define a build <method> inside the App class
  Widget build(BuildContext context) {
    ///  return the materialApp from the build method
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image App"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            fetchImages();
          },
          child: Icon(Icons.add),
        ),
        body: Text("You have pressed $counter times "),
      ),
    );
  }
  void fetchImages() async {
    counter ++;
    var url = Uri.parse("https://jsonplaceholder.typicode.com/photos/$counter");
    var response = await get(url);

    Map<String,dynamic> body = jsonDecode(response.body);

    var imageModel = ImageModel.fromJson(body);

    setState(() {
      imageList.add(imageModel);
    });
  }
}
