import 'dart:convert';
import 'package:app_movies/models/movie_model.dart';

class Response {
  Response({
    required this.page,
    required this.results,
    required this.totalPages,
    required this.totalResults,
  });

  int page;
  List<Movie> results;
  int totalPages;
  int totalResults;

  factory Response.fromJson(String str) => Response.fromMap(json.decode(str));


  factory Response.fromMap(Map<String, dynamic> json) => Response(
    page: json["page"],
    results: List<Movie>.from(json["results"].map((x) => Movie.fromMap(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );
}