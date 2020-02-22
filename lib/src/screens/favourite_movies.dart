import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:movies_list_app/src/notifiers/popular_movies_notifier.dart';
import 'package:movies_list_app/src/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class FavouriteMoviesScreen extends StatefulWidget {
  @override
  _FavouriteMoviesScreenState createState() => _FavouriteMoviesScreenState();
}


class _FavouriteMoviesScreenState extends State<FavouriteMoviesScreen> {

  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) async{
     PopularMoviesNotifier.of(context).getFavouriteMovies();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite Movies'),
      ),
      body: Container(
        child: Consumer<PopularMoviesNotifier>(
          builder: (context, moviesNotifier, _){
            if(moviesNotifier.isLoadingFavouriteMovies){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return ListView.builder(
              itemCount: moviesNotifier.favouriteMovies.length,
              itemBuilder: (context, itemIndex){
                final favouriteMovie = moviesNotifier.favouriteMovies[itemIndex];
                return MovieCard(movie: favouriteMovie,);
              });
          },
        ),
      ),
    );
  }
}
