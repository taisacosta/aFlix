import 'package:flutter/material.dart';

class MovieDetailsWindow extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Details'),
      ),
      body: Column(
        children: <Widget>[
          Text("movie details"),
        ]
      )
    );
  }
}