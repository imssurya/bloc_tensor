class Movie {
  final String title, poster_path, overview;
  Movie({this.title, this.poster_path, this.overview});
  Movie.fromJson(Map json)
      : title = json['title'],
        poster_path = json['poster_path'],
        overview = json['overview'];
}
