import 'package:app_movies/providers/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    final moviesProvider = Provider.of<MoviesProvider>(context);
    var size = MediaQuery.of(context).size;

    if(moviesProvider.movies.isEmpty){
      return  Scaffold(
        body: SizedBox(
          width: double.infinity,
          height: size.height * 0.5,
          child: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Peliculas'),
        elevation: 0,
      ),
      body: Swiper(
        itemCount: moviesProvider.movies.length,
        layout: SwiperLayout.STACK,
        itemWidth: size.width * 0.8,
        itemHeight: size.height * 0.8,
        itemBuilder: (_ , int index){

          final movie = moviesProvider.movies[index];
          movie.heroId = 'swiper-${ movie.id }';

          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, 'details',arguments: movie),
            child: Hero(
              tag: movie.heroId!,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage(
                  placeholder: const AssetImage('assets/no-image.jpg'),
                  image: NetworkImage(movie.fullPosterImg),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
