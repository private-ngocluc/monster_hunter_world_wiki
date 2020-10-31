import 'dart:convert';

import 'package:monster_hunter_world_wiki/data/app_database.dart';
import 'package:monster_hunter_world_wiki/data/daos/base_dao.dart';
import 'package:monster_hunter_world_wiki/models/models.dart';
import 'package:sqflite/sqflite.dart';

class MonsterDAO extends BaseDAO<Monster> {
  static const COLLECTION_NAME = 'Monsters';

  Future<Database> get _db async => await AppDatabase.instance.database;

  // @override
  // Future<Monster> getbyID(int id) async {
  //   Database db = await _db;
  //   final recordResult = await _collection.find(db,
  //       finder: Finder(filter: Filter.equals('id', id)));
  //   if (recordResult != null) {
  //     final record = Monster.fromJson(recordResult[0].value);
  //     return record;
  //   }
  //   return null;
  // }

  @override
  Future fetchData() async {
    Database db = await _db;
    final result = await _fetchAllMonsters();
    if (await _collection.count(db) == 0) {
      await _collection.addAll(db, result.map((emp) => emp.toJson()).toList());
    } else {
      //* Because [array.forEach] not work like [async] (await),
      /// So, we need use Future.forEach to do this.
      /// For Example:
      ///    Future callOne(String time) async {
      ///      await Future.delayed(
      ///        Duration(seconds: 2),
      ///        () => print('one ${time}st'),
      ///      );
      ///    }

      ///    void callTwo() async {
      ///      print('----run v1------');
      ///      [1, 2].forEach(
      ///        (number) async => await callOne(number.toString()),
      ///      );
      ///      print('two v1');
      ///    }

      ///    void callTwoV2() async {
      ///      print('----run v2------');
      ///      await Future.forEach(
      ///        [3, 4],
      ///        (number) async => await callOne(number.toString()),
      ///      );
      ///      print('two v2');
      ///    }

      ///    void main() {
      ///      callTwo();
      ///      callTwoV2();
      ///    }
      /// ---------------------------[END EXAMPLE]-----------------------------

      await Future.forEach(result, (emp) async {
        var find = Finder(filter: Filter.equals('id', emp.id));
        var record = await _collection.findFirst(db, finder: find);
        if (record == null) {
          await insert(emp);
        } else {
          await update(emp.id, emp);
        }
      });
    }
  }

  @override
  Future delete(Monster record) {
    // ignore: todo
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<Monster>> findByKeyWord(String key) {
    // ignore: todo
    // TODO: implement findByKeyWord
    throw UnimplementedError();
  }

  @override
  Future<List<Monster>> getAllSortedByName() {
    // ignore: todo
    // TODO: implement getAllSortedByName
    throw UnimplementedError();
  }

  @override
  Future<Monster> getbyID(int id) {
    // ignore: todo
    // TODO: implement getbyID
    throw UnimplementedError();
  }

  @override
  Future insert(Monster record) {
    // ignore: todo
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future update(int recordID, Monster record) {
    // ignore: todo
    // TODO: implement update
    throw UnimplementedError();
  }
}
