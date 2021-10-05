class Movie{
  final String title;
  final String year;
  final String imdbId;
  final String poster;
  final String director;
  final String actors;
  final String genre;
  final String released;

  Movie({
    required this.imdbId,
    required this.title,
    required this.poster,
    required this.year,
    required this.director,
    required this.actors,
    required this.genre,
    required this.released,
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
      released: json["Released"]
    );
  }
}