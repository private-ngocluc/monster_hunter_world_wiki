import 'dart:async';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDatabase {
  // singleton instance [Singleton Pattern]
  static final AppDatabase _singleton = AppDatabase._();

  // public method to access application db from global
  static AppDatabase get instance => _singleton;

  // use for transforming synchronous result to asynchronous
  Completer<Database> _dbOpenCompleter;

  // private constructor for confirm that this db cannot create outsite itself class
  AppDatabase._();

  // Application database access
  Future<Database> get database async {
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();

      _openDatabase();
    }
    return _dbOpenCompleter.future;
  }

  Future delete() async {
    _deleteDatabase();
  }

  Future _deleteDatabase() async {
    /// Check and make sure db is closed()
    Database db = await _dbOpenCompleter.future;
    await db.close();

    // delete the database
    try {
      await deleteDatabase(db.path);
    } catch (error) {
      print('$error');
    }

    ///renew completer for nexttime
    _dbOpenCompleter = null;
    await database;
  }

  Future _openDatabase() async {
    // get the application documents directory
    final appDocumentDir = await getApplicationDocumentsDirectory();

    // make sure it exists
    await appDocumentDir.create(recursive: true);

    // build the database path
    final dbPath = join(appDocumentDir.path, 'mhw.db');

    // open the database
    final database = await openDatabase(dbPath);
    return _dbOpenCompleter.complete(database);
  }
}
