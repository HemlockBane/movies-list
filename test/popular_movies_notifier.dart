import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movies_list_app/src/models/movie.dart';
import 'package:movies_list_app/src/notifiers/popular_movies_notifier.dart';
import './mocked_classes/mock.dart';



void main(){
  ApiServiceMock apiServiceMock;
  //LocalDbServiceMock localDbServiceMock;
  test('popular movies notifier returns a list of movies', ()async{
    apiServiceMock = ApiServiceMock();
    //localDbServiceMock = LocalDbServiceMock();
    when(apiServiceMock.getMovies()).thenAnswer((_) => Future.value(getDummyMovies()));
    final popularMoviesNotifier = PopularMoviesNotifier();
   final movies = popularMoviesNotifier.getMovies();

   expect(movies, isNotNull);
  });


}