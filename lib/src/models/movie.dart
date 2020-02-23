import 'package:movies_list_app/src/constants/strings.dart';

class Movie {
  int id = 0;
  String title = '';
  DateTime releaseDate;
  double voteAverage = 0.0;
  String posterPath = '';
  String overView = '';
  double popularity = 0.0;
  bool isFavourite = false;


  Movie.fake(){
    id = 419704;
    title = 'Ad Astra';
    releaseDate = DateTime.parse('2019-09-17');
    posterPath = '\/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg';
    overView = Strings.fakeOverview;
    isFavourite = false;
    voteAverage = 7.4;

  }

  Movie.fromJson(Map json){
    id = json['id'];
    title = json['title'];
    releaseDate = DateTime.parse(json['release_date']);
    posterPath = json['poster_path'];
    overView = json['overview'];
    voteAverage = double.tryParse(json['vote_average'].toString()) ?? 0.0;
    isFavourite = json['is_favourite'] ?? false;
    popularity = double.tryParse(json['popularity'].toString()) ?? 0.0;
  }


  Movie.fromMap(Map json){
    id = json['id'];
    title = json['title'];
    releaseDate = DateTime.parse(json['release_date']);
    posterPath = json['poster_path'];
    overView = json['overview'];
    voteAverage = double.tryParse(json['vote_average'].toString()) ?? 0.0;
    isFavourite = mapIntegerToBool(json['is_favourite']);
    popularity = double.tryParse(json['popularity'].toString()) ?? 0.0;
  }


  Map<String, dynamic> toMap(){
    Map<String, dynamic> map = Map();
    map['id'] = id;
    map['title'] = title;
    map['release_date'] = releaseDate.toString();
    map['vote_average'] = voteAverage;
    map['poster_path'] = posterPath;
    map['overview'] = overView;
    map['popularity'] = popularity;
    map['is_favourite'] = isFavourite ? 1 : 0;
    return map;
  }

  bool mapIntegerToBool(int value){
    if(value == 1) {
      return true;
    }

    return false;
  }


  void toggleFavourite(){
    isFavourite = !isFavourite;
  }


  @override
  String toString() {
    return''
      'id - $id, '
      'title - $title, '
      'release_date - $releaseDate, '
      'vote_average - $voteAverage, '
      'poster_path - $posterPath, '
      'overview = $overView, '
      'popularity - $popularity, '
      'is_favourite - $isFavourite';
  }
}


List<Movie>getDummyMovies(){
  return List.generate(10, (_){
    return Movie.fake();
  });
}
