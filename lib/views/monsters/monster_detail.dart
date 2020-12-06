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
            renderBody([widget.monster.description]),
          ],
        ),
      ),
    );
  }

  Widget renderHeader(int monsterID, String monsterName) {
    return Column(
      children: [],
    );
  }

  Widget renderBody(List<dynamic> bodyDatas) {
    return Container(
      child: Text('Monster info'),
    );
  }
}
