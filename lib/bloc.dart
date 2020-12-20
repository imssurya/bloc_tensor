import 'package:bloc_tensor/api.dart';
import 'package:bloc_tensor/model.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final Api api;
  Stream<List<Movie>> _results = Stream.empty();
  Stream<String> _log = Stream.empty();
  ReplaySubject<String> _query = ReplaySubject<String>();

  Stream<String> get log => _log;
  Stream<List<Movie>> get results => _results;
  Stream<String> get query => _query;
  MovieBloc({this.api}) {
    _results = _query.distinct().asyncMap(api.get).asBroadcastStream();
    _log=Observable(results).
  }
}
