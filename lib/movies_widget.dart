import 'package:anthorflix/movie.dart';
import 'package:flutter/material.dart';

class MoviesWidget extends StatelessWidget{
  final List<Movie> movies;
  MoviesWidget({required this.movies});

  void _pressCallback(){

  }

  @override
  Widget build(BuildContext context){
    return ListView.builder( // scrolling widget
      itemCount: movies.length,
      itemBuilder: (context, index){
        final movie = movies[index];
        return ListTile(
          trailing: Image.network(movie.poster),
          title: Text(movie.title),
          subtitle: Text(movie.year),
          onLongPress: () => _pressCallback,
        );
      }
    );
  }
}