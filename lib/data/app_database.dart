import 'dart:async';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
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
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "mhw.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(join("assets", "database/mhw.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }

    // open the database
    final database = await openDatabase(path, readOnly: true);

    return _dbOpenCompleter.complete(database);
  }
}
