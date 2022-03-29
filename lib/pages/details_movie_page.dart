import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';
import '../models/movie_model.dart';
import '../widgets/poster_widget.dart';

class DetailsMoviePage extends StatelessWidget {
  const DetailsMoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          CustomAppBar(movie: movie),
          SliverList(delegate: SliverChildListDelegate(
            [
              PosterWidget(movie: movie,),
              movieData(movie,context),
            ]
          ))
          //movieData(movie,context)
        ],
      ),
    );
  }

  Widget movieData(Movie movie,BuildContext context){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Text(
        movie.overview,
        textAlign: TextAlign.justify,
        style: Theme.of(context).textTheme.subtitle1,
      ),
    );
  }
}

