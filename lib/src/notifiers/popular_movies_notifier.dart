import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:movies_list_app/src/models/movie.dart';
import 'package:movies_list_app/src/services/api_service.dart';
import 'package:provider/provider.dart';

class PopularMoviesNotifier with ChangeNotifier {
  static PopularMoviesNotifier of(BuildContext context) =>
      Provider.of<PopularMoviesNotifier>(context, listen: false);

  bool _isLoadingMovies = false;
  List<Movie> _movies = [];
  ApiService _apiService = ApiService();

  bool get isLoadingMovies => _isLoadingMovies;

  UnmodifiableListView<Movie> get allMovies => UnmodifiableListView(_movies);

  UnmodifiableListView<Movie> get favouriteMovies =>
      UnmodifiableListView(_movies.where((movie) => movie.isFavourite));

  void toggleFavourite({Movie movie}) {
    final movieIndex = _movies.indexOf(movie);
    _movies[movieIndex].toggleFavourite();
    notifyListeners();
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


}
