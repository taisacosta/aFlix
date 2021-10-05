import 'dart:convert';
import 'package:anthorflix/movie_details.dart';
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
  //List<Movie> _movies = List<Movie>.empty();
  List<Movie> _movies = List.empty(growable: true);
  String _movie_name = "Harry Potter";

  @override
  void initState(){
    super.initState();
    _populateAllMovies();
  }

  void _populateAllMovies() async {
    //final movies = await _fetchOMDbMovies();
    Movie movie = await _fetchOMDbMovies();
    setState(() {
      //_movies = movies;
      _movies.add(movie);
    });
  }

  //Future<List<Movie>>
  Future<Movie> _fetchOMDbMovies() async {
    final response =  await http.get(Uri.parse("http://www.omdbapi.com/?t=$_movie_name&plot=full&page=2&apikey=3d041907"));
    if (response.statusCode == 200){
      final result = jsonDecode(response.body);
      //Iterable list = result["Search"];
      //return list.map((movie) => Movie.fromJson(movie)).toList();
      return  Movie.fromJson(result);
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
          leading: Image.asset('assets/images/anthor.png'),
          title: const Text('Anthorflix'),
        ),
        body: MoviesWidget(movies: _movies),
        floatingActionButton: const FloatingActionButton(
          tooltip: 'Add a movie',
          onPressed: null,
          child: Icon(
            Icons.add,
            color: Colors.green,
            size: 40,
          ),
          backgroundColor: Colors.black,
        ),
      ),
    );
  }
}
