import 'package:flutter/material.dart';

import '../models/movie_model.dart';

class CustomAppBar extends StatelessWidget {

  final Movie movie;
  const CustomAppBar({Key? key,required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.blue,
      expandedHeight: 200,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        titlePadding: EdgeInsets.all(2),
        title: Container(
          width: double.infinity,
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(left: 10,right: 10,bottom: 10),
          color: Colors.black12,
          child: Text(
            movie.title,
            style: TextStyle(fontSize: 18),
            textAlign: TextAlign.center,
          ),
        ),
        background: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'),
          image: NetworkImage(movie.fullBackdropPath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
