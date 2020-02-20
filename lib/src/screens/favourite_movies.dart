import 'package:flutter/material.dart';
import 'package:movies_list_app/src/notifiers/popular_movies_notifier.dart';
import 'package:movies_list_app/src/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class FavouriteMoviesScreen extends StatefulWidget {
  @override
  _FavouriteMoviesScreenState createState() => _FavouriteMoviesScreenState();
}

class _FavouriteMoviesScreenState extends State<FavouriteMoviesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Movies'),
      ),
      body: Container(
        child: Consumer<PopularMoviesNotifier>(
          builder: (context, moviesNotifier, _){
            return ListView.builder(
              itemCount: moviesNotifier.favouriteMovies.length,
              itemBuilder: (context, itemIndex){
                final dummyFavouriteMovie = moviesNotifier.favouriteMovies[itemIndex];
                return MovieCard(movie: dummyFavouriteMovie,);
              });
          },
        ),
      ),
    );
  }
}
