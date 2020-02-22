import 'package:movies_list_app/src/models/movie.dart';
import 'package:sqflite/sqflite.dart' as db;
import 'package:path/path.dart' as path;

class LocalDbService {
  final favouritesDbName = 'favourite_movies.db';
  Future<db.Database> favouritesDb;
  final favouritesTable = 'favourites';
  final sql =
      'CREATE TABLE favourites(serial_id INTEGER PRIMARY KEY, id INTEGER, title TEXT, release_date TEXT, vote_average REAL, poster_path TEXT, overview TEXT, popularity REAL, is_favourite INTEGER)';

  LocalDbService(){
    _openDatabase();
  }

  _openDatabase() async {
    favouritesDb = db
        .openDatabase(path.join(await db.getDatabasesPath(), favouritesDbName),
            onCreate: (db, version) {
      return db.execute(sql);
    }, version: 1);
  }

  Future<void> insertFavouriteMovie({Movie favouriteMovie}) async {
    final db.Database db1 = await favouritesDb;
    await db1.insert(favouritesTable, favouriteMovie.toMap(),
        conflictAlgorithm: db.ConflictAlgorithm.replace);
  }

  Future<List<Movie>> getFavouriteMovies()async{
    final db.Database db1 = await favouritesDb;
    final List<Map<String, dynamic>> maps = await db1.query(favouritesTable);

    return List.generate(maps.length, (index){
      return Movie.fromMap(maps[index]);
    });
  }

  Future<void> removeFavouriteMovie({Movie favouriteMovie}) async {
    final db.Database db1 = await favouritesDb;
    await db1.delete(favouritesTable, where: "id = ?", whereArgs: [favouriteMovie.id]);
  }
}
