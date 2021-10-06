/// Classe que representa a Widget que mostra os detalhes do filme

import 'package:anthorflix/movie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MoviesWidget extends StatefulWidget {
  Movie movie;
  MoviesWidget({required this.movie});
  @override
  _MoviesWidget createState() => _MoviesWidget();
}

class _MoviesWidget extends State<MoviesWidget>{

  @override
  void initState(){
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return ListView(
        children: [
          Text(
            widget.movie.title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
          ),
          Text(
            widget.movie.year,
            textAlign: TextAlign.center,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: Colors.green )
          ),
          Center(
            child: RatingBar.builder(
              minRating: 0,
              itemBuilder: (context, _) => Icon(Icons.star, color: Colors.amber),
              onRatingUpdate: (rating) {
                setState(() {
                  widget.movie.rating = rating;
                });
              },
            ),
          ),
          Image.network(widget.movie.poster),
          const Text(
              "Elenco",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Text(widget.movie.actors),
          const Text(
              "Diretor(a):",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Text(widget.movie.director),
          const Text(
              "Data do lançamento:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Text(widget.movie.released),
          const Text(
              "Gênero:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Text(widget.movie.genre),
          const Text(
              "Descrição:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
          Text(widget.movie.plot),
          const Text(
              "Comentários:",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)
          ),
      ],
    );
  }

 }