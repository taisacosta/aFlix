/// Classe que representa o filme e suas características, e também as avaliações
class Movie{
  String title;
  String year;
  String imdbId;
  String poster;
  String director;
  String actors;
  String genre;
  String released;
  String plot;
  double rating = 0;
  List<String> comments = [];

  Movie({
    required this.imdbId,
    required this.title,
    required this.poster,
    required this.year,
    required this.director,
    required this.actors,
    required this.genre,
    required this.released,
    required this.plot
  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      title: json["Title"],
      year: json["Year"],
      imdbId: json["imdbID"],
      poster: json["Poster"],
      director: json["Director"],
      actors: json["Actors"],
      genre: json["Genre"],
      released: json["Released"],
      plot: json["Plot"],
    );
  }
}