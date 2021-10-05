/// Classe que representa a Widget que mostra os detalhes do filme

import 'package:anthorflix/movie.dart';
import 'package:flutter/material.dart';

class MoviesWidget extends StatelessWidget{
  final Movie movie;
  MoviesWidget({required this.movie});

  @override
  Widget build(BuildContext context){
    return ListView(
        children: [
          Text(
            movie.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold)
          ),
          Text(movie.year),
          Image.network(movie.poster),
          Text(movie.actors),
          Text(movie.director),
          Text(movie.released),
          Text(movie.genre),
          Text(movie.plot)
      ],
    );
  }
}