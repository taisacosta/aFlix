import 'dart:convert';
import 'package:anthorflix/movies_widget.dart';
import 'package:anthorflix/movie.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(AnthorflixApp());

class AnthorflixApp extends StatefulWidget {
  @override
  _MainWindow createState() => _MainWindow();
}

class _MainWindow extends State<AnthorflixApp> {
  List<Movie> _movies = List<Movie>.empty();

  @override
  void initState(){
    super.initState();
    _populateAllMovies();
  }

  void _populateAllMovies() async {
    final movies = await _fetchOMDbMovies();
    setState(() {
      _movies = movies;
    });
  }

  Future<List<Movie>> _fetchOMDbMovies() async {
    final response =  await http.get(Uri.parse("http://www.omdbapi.com/?s=Harry Potter&page=2&apikey=3d041907"));
    if (response.statusCode == 200){
      final result = jsonDecode(response.body);
      Iterable list = result["Search"];
      return list.map((movie) => Movie.fromJson(movie)).toList();
    }
    else {
      throw Exception("Loading movies has failed");
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anthorflix',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Anthorflix'),
        ),
        body: MoviesWidget(movies: _movies)

      ),
    );
  }
}
