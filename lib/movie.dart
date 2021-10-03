class Movie{
  final String title;
  final String year;
  final String imdbId;
  final String poster;

  Movie({required this.imdbId, required this.title, required this.poster, required this.year});

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      title: json["Title"],
      year: json["Year"],
      imdbId: json["imdbID"],
      poster: json["Poster"]
    );
  }
}