import 'package:movies_list_app/src/constants/strings.dart';

class Movie {
  int id = 0;
  String title = '';
  String originalTitle = '';
  DateTime releaseDate;
  double voteAverage = 0.0;
  String originalLanguage = '';
  String posterPath = '';
  String overView = '';
  String backdropPath = '';
  double popularity = 0.0;
  bool isAdult = false;
  bool isFavourite = false;


  Movie.fake(){
    id = 419704;
    title = 'Ad Astra';
    originalTitle = 'Ad Astra';
    releaseDate = DateTime.parse('2019-09-17');
    posterPath = '\/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg';
    backdropPath = '\/5BwqwxMEjeFtdknRV792Svo0K1v.jpg';
    overView = Strings.fakeOverview;
    isFavourite = false;
    voteAverage = 7.4;

  }

  Movie.fromMap(Map json){}


  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = Map();


    return map;
  }
}


List<Movie>getDummyMovies(){
  return List.generate(10, (_){
    return Movie.fake();
  });
}
