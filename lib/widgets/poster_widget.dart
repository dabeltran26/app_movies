import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class PosterWidget extends StatelessWidget {
  final Movie movie;
  const PosterWidget({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme txtTheme = Theme.of(context).textTheme;
    final size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 25),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Hero(
            tag: movie.heroId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: FadeInImage(
                placeholder: const AssetImage('assets/no-image.jpg'),
                image: NetworkImage(movie.fullPosterImg),
                height: size.height * 0.25,
              ),
            ),
          ),
          SizedBox(
            width: 20,
          ),
          ConstrainedBox(
            constraints: BoxConstraints(maxWidth: size.width - 170),
            child: Column(
              children: [
                Text(movie.title,style: txtTheme.headline3,overflow: TextOverflow.ellipsis,maxLines: 2,),
                Text(movie.originalTitle,style: txtTheme.headline5,overflow: TextOverflow.ellipsis,maxLines: 2,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
