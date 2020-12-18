part of '../views.dart';

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
            Expanded(
                child: renderBody([
              {'description': widget.monster.description}
            ])),
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
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          elevation: 0,
          bottom: TabBar(
            tabs: bodyDatas.map((data) {
              return Tab(
                text: data.keys.elementAt(0),
              );
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: bodyDatas.map((data) {
            return buildChildTabContent(data);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildChildTabContent(Map<String, dynamic> tabDatas) {
    var tabName = tabDatas.keys.elementAt(0);
    if (tabName == 'description') {
      return buildDescriptionTab(tabDatas[tabName]);
    } else {
      return Container(child: Text('No Datas'));
    }
  }

  Widget buildDescriptionTab(String description) {
    return Container(child: Text(description));
  }
}
