// import the material standard library

import 'package:flutter/material.dart';


///  define app class that extends *StatelessWidgets*
class App extends StatefulWidget {

  AppState createState() {
    return AppState();
  }
}


class AppState extends State<App> {

  int counter = 0;

  ///  Define a build <method> inside the App class
  Widget build(BuildContext context){
    ///  return the materialApp from the build method
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Image App"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            print("Button Clicked");

            setState(
                    () {
                      counter = counter + 1;
            });

          },
          child: Icon(Icons.add),
        ),
        body: Text("You have pressed $counter times "),
      ),
    );
  }

}

