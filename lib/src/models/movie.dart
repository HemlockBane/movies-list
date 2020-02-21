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

  Movie.fromMap(Map json){
    id = json['id'];
    title = json['title'];
    originalTitle = json['original_title'];
    releaseDate = DateTime.parse(json['release_date']);
    posterPath = json['poster_path'];
    backdropPath = json['backdrop_path'];
    overView = json['overview'];
    voteAverage = double.tryParse(json['vote_average'].toString()) ?? '0.0';
    isFavourite = json['is_favourite'] ?? false;
  }

  void toggleFavourite(){
    isFavourite = !isFavourite;
  }


  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = Map();


    return map;


  }

  @override
  String toString() {
    return'id - $id, title - $title';
  }
}


List<Movie>getDummyMovies(){
  return List.generate(10, (_){
    return Movie.fake();
  });
}
