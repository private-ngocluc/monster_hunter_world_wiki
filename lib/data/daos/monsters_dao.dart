part of 'daos.dart';

class MonsterDAO extends BaseDAO<Monster> {
  Future<Database> get _db async => await AppDatabase.instance.database;
  final config = GlobalConfiguration();

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
  Future<List<Monster>> getAllSortedByName() async {
    Database db = await _db;
    final lang = config.getValue('lang');
    List<Map> results = await db.rawQuery("""
          SELECT mon.id, mt.name, mt.description, mon.size, mt.ecology
		      FROM monster as mon
          LEFT JOIN monster_text AS mt ON mon.id = mt.id
          LEFT JOIN language AS la ON mt.lang_id = la.id
          WHERE mt.lang_id = '$lang' AND mon.size = 'large'
                           """);

    return results.map((monsterData) {
      final monster = Monster.fromJson(monsterData);
      return monster;
    }).toList();
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
