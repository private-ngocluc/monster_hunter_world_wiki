import 'package:monster_hunter_world_wiki/models/base_model.dart';

abstract class BaseDAO<T extends BaseModel> {
  // * Fetch
  Future fetchData() async {}

  Future<List<T>> findByKeyWord(String key);

  //*  CRUD base
  Future insert(T record);
  Future update(int recordID, T record);
  Future delete(T record);
  Future<T> getbyID(int id);
  Future<List<T>> getAllSortedByName();
}
