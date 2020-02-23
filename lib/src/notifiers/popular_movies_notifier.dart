import 'dart:collection';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:movies_list_app/src/models/movie.dart';
import 'package:movies_list_app/src/services/api_service.dart';
import 'package:movies_list_app/src/services/local_db_service.dart';
import 'package:provider/provider.dart';

class PopularMoviesNotifier with ChangeNotifier {
  static PopularMoviesNotifier of(BuildContext context) =>
      Provider.of<PopularMoviesNotifier>(context, listen: false);

  bool _isLoadingMovies = false;
  bool _isLoadingFavouriteMovies = false;
  List<Movie> _movies = [];
  List<Movie> _favouriteMovies = [];
  ApiService _apiService = ApiService();
  LocalDbService _localDbService = LocalDbService();

  bool get isLoadingMovies => _isLoadingMovies;
  bool get isLoadingFavouriteMovies => _isLoadingFavouriteMovies;

  UnmodifiableListView<Movie> get allMovies => UnmodifiableListView(_movies);

  UnmodifiableListView<Movie> get favouriteMovies =>
      UnmodifiableListView(_favouriteMovies);


  void toggleFavourite({Movie movie, bool isFavouritesScreenDetails}) async{
    final movieIndex = _movies.indexOf(movie);
    //log('popular_movies_notifier.dart: is in movies ${_movies.contains(movie).toString()}');
    //log('popular_movies_notifier.dart: ${movie.toString()}');
    //log('popular_movies_notifier.dart: movies index - $movieIndex');
    _movies[movieIndex].toggleFavourite();
    notifyListeners();
    final isFavourite = _movies[movieIndex].isFavourite;
    if(isFavourite){
      _favouriteMovies.add(movie);
      //log('${_favouriteMovies.length}');
      //print(movie.toMap());
      await _localDbService.insertFavouriteMovie(favouriteMovie: movie);
    }else{
      _favouriteMovies.remove(movie);
      await _localDbService.removeFavouriteMovie(favouriteMovie: movie);
    }

    notifyListeners();
  }


  Future <List<Movie>> getMovies() async {
    _isLoadingMovies = true;
    notifyListeners();
    try {
      _movies = await _apiService.getMovies();
    }
    catch (e) {
      print(e);
    }
    _isLoadingMovies = false;
    notifyListeners();
    return _movies;
  }

  Future <void> getFavouriteMovies() async {
    _isLoadingFavouriteMovies = true;
    notifyListeners();
    try {
      _favouriteMovies = await _localDbService.getFavouriteMovies();
    }
    catch (e) {
      print(e);
    }
    _isLoadingFavouriteMovies = false;
    notifyListeners();
  }


}
