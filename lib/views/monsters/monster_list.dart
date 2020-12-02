import 'package:flutter/material.dart';
import 'package:monster_hunter_world_wiki/data/daos/monsters_dao.dart';
import 'package:monster_hunter_world_wiki/models/models.dart';
import 'package:monster_hunter_world_wiki/utils/routes/routes.dart';

class MonsterListScreen extends StatefulWidget {
  MonsterListScreen({Key key}) : super(key: key);

  @override
  _MonsterListScreenState createState() => _MonsterListScreenState();
}

class _MonsterListScreenState extends State<MonsterListScreen> {
  MonsterDAO _monsterDAO = MonsterDAO();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: FutureBuilder<List<Monster>>(
        future: _getMonsterData(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Monster>> snapshot) {
          if (snapshot.hasData) {
            return renderListMonsters(snapshot.data);
          } else {
            return Center(
              child: Text('No Thing'),
            );
          }
        },
      ),
    );
  }

  Widget renderListMonsters(List<Monster> datas) {
    return ListView.builder(
      itemCount: datas.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () =>
              Navigator.pushReplacementNamed(context, monsterDetailRoute),
          child: Container(
            child: Row(
              children: [
                renderMonsterImg(datas[index].id),
                renderMonsterName(datas[index].name)
              ],
            ),
          ),
        );
      },
    );
  }

  Widget renderMonsterImg(int id) {
    return Container(
      width: MediaQuery.of(context).size.width / 3,
      child: Image(
        image: AssetImage('assets/images/monsters/$id.png'),
      ),
    );
  }

  Widget renderMonsterName(String name) {
    return Container(
      width: MediaQuery.of(context).size.width * 2 / 3,
      child: ListTile(
        title: Text(
          name,
          style: TextStyle(fontSize: 16.0),
        ),
      ),
    );
  }

  Future<List<Monster>> _getMonsterData() async {
    final monsters = await _monsterDAO.getAllSortedByName();
    return monsters;
  }
}
