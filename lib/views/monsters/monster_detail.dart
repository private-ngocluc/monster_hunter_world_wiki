import 'package:flutter/material.dart';
import 'package:monster_hunter_world_wiki/models/models.dart';

class MonsterDetailScreen extends StatefulWidget {
  final Monster monster;
  MonsterDetailScreen({Key key, this.monster}) : super(key: key);

  @override
  _MonsterDetailScreenState createState() => _MonsterDetailScreenState();
}

class _MonsterDetailScreenState extends State<MonsterDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            renderHeader(widget.monster.id, widget.monster.name),
            Expanded(child: renderBody([widget.monster.description])),
          ],
        ),
      ),
    );
  }

  Widget renderHeader(int monsterID, String monsterName) {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Image(
            image: AssetImage('assets/images/monsters/$monsterID.png'),
          ),
        ),
        Expanded(
          child: Container(
            child: ListTile(
              title: Text(
                monsterName,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget renderBody(List<dynamic> bodyDatas) {
    return DefaultTabController(
      length: bodyDatas.length,
      child: ListView(
        children: [
          TabBar(
            tabs: [
              Tab(text: 'Information'),
            ],
          ),
          TabBarView(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text(bodyDatas[0]),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
