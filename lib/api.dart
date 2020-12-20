import 'dart:convert';

import 'package:bloc_tensor/api_key.dart';
import 'package:bloc_tensor/model.dart';
import 'package:http/http.dart' as http;

class Api {
  final http.Client client = http.Client();
  static const String url =
      'https://api.themoviedb.org/3/search/movie?api_key=$api_key&query={1}';
  Future<List<Movie>> get(String query) async {
    List<Movie> list = [];
    await client
        .get(Uri.parse(url.replaceFirst("{1}", query)))
        .then((res) => res.body)
        .then(json.decode)
        .then((json) => json['results'])
        .then(
          (movies) => movies.forEach(
            (movie) => list.add(
              Movie.fromJson(movie),
            ),
          ),
        );
    return list;
  }
}
