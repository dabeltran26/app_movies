import 'dart:async';

import 'package:app_movies/models/movie_model.dart';
import 'package:app_movies/models/response_api.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

  String _apiKey = 'ec3dc753b3c0b55dba3d3e498f38cd18';
  String _urlBase = 'api.themoviedb.org';
  String _language = 'es-ES';

  int _page = 0;
  List<Movie> movies = [];

  final StreamController<List<Movie>> _suggestionStreamContoller = new StreamController.broadcast();
  Stream<List<Movie>> get suggestionStream => this._suggestionStreamContoller.stream;

  MoviesProvider(){
    this.getMovies();
  }

  getMovies() async {
    _page++;
    final url = Uri.https(_urlBase, '3/movie/popular',{
      'api_key' : _apiKey,
      'language': _language,
      'page': '$_page'
    });
    final response = await http.get(url);
    final moviesResponse = Response.fromJson(response.body);
    movies = [...movies , ...moviesResponse.results];
    notifyListeners();
  }

}