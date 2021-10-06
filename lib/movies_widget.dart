/// Classe que representa a Widget que mostra os detalhes do filme

import 'package:anthorflix/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

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
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
          ),
          Text(
            movie.year,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green )
          ),
          Center(
            child: RatingBar.builder(
              minRating: 0,
              itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                movie.rating = rating;
              },
            ),
          ),
          Image.network(movie.poster),
          const Text(
              "Elenco",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Text(movie.actors),
          const Text(
              "Diretor(a):",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Text(movie.director),
          const Text(
              "Data do lançamento:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Text(movie.released),
          const Text(
              "Gênero:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Text(movie.genre),
          const Text(
              "Descrição:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Text(movie.plot),
          const Text(
              "Comentários:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
      ],
    );
  }
}