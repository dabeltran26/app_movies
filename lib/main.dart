import 'package:app_movies/pages/details_movie_page.dart';
import 'package:app_movies/pages/home_page.dart';
import 'package:app_movies/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MoviesProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App Peliculas',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'details': (_) => DetailsMoviePage(),
        },
      ),
    );
  }
}
