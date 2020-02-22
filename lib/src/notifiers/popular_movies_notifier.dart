import 'dart:collection';

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

  void toggleFavourite({Movie movie}) async{
    final movieIndex = _movies.indexOf(movie);
    _movies[movieIndex].toggleFavourite();
    notifyListeners();
    final isFavourite = _movies[movieIndex].isFavourite;
    if(isFavourite){
      _favouriteMovies.add(movie);
      print(movie.toMap());
      _localDbService.insertFavouriteMovie(favouriteMovie: movie);
     final faves = await _localDbService.getFavouriteMovies();
    }else{
      _favouriteMovies.remove(movie);
      _localDbService.removeFavouriteMovie(favouriteMovie: movie);
      final faves = await _localDbService.getFavouriteMovies();
    }
  }


  Future <void> getMovies() async {
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
