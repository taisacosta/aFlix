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
  Movie _movie = Movie(imdbId: "id", title: "title", poster: "poster", year: "year",
      director: "director", actors: "actors", genre: "genre", released: "released",
      plot: "plot");
  String _movie_name = " ";
  Icon _searchIcon = Icon(Icons.search);
  Widget _appBarTitle = Text( 'Anthorflix' );
  String _searchText = "";
  final TextEditingController _textController = TextEditingController();

  @override
  void initState(){
    super.initState();
  }

  void _populateMovieContent() async {
    Movie movie = await _fetchOMDbMovie();
    setState(() {
      _movie = movie;
    });
  }

  Future<Movie> _fetchOMDbMovie() async {
    final response =  await http.get(
        Uri.parse("http://www.omdbapi.com/?t=$_movie_name&plot=full&apikey=3d041907"));
    if (response.statusCode == 200){
      final result = jsonDecode(response.body);
      return  Movie.fromJson(result);
    }
    else {
      throw Exception("Loading movies has failed");
    }
  }
  void _searchPressed() {
    setState(() {
      if (_searchIcon.icon == Icons.search) {
        _searchIcon = Icon(Icons.close);
        _appBarTitle = TextField(
          controller: _textController,
          decoration: const InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Digite nome do filme',
          ),
          onSubmitted: (String str){
            _movie_name = str;
            _populateMovieContent();
          }
        );
      } else {
        _searchIcon = Icon(Icons.search);
        _appBarTitle = Text('Anthorflix');
        _textController.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Anthorflix',
      theme: ThemeData(primarySwatch: Colors.green),
      home: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              onPressed: (){
                _searchPressed();
              },
              icon: _searchIcon,
            ),
          ],
          leading: Image.asset('assets/images/anthor.png'),
          title: _appBarTitle,
        ),
        body: MoviesWidget(movie: _movie),
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
