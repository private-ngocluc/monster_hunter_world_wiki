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
            renderHeader(),
            Expanded(child: renderBody()),
          ],
        ),
      ),
    );
  }

  Widget renderHeader() {
    return Row(
      children: [
        Container(
          width: MediaQuery.of(context).size.width / 3,
          child: Image(
            image:
                AssetImage('assets/images/monsters/${widget.monster.id}.png'),
          ),
        ),
        Expanded(
          child: Container(
            child: ListTile(
              title: Text(
                widget.monster.name,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
          ),
        )
      ],
    );
  }

  Widget renderBody() {
    final dataTables = ['Summary'];
    return DefaultTabController(
      length: dataTables.length,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.brown,
          elevation: 0,
          bottom: TabBar(
            tabs: dataTables.map((data) {
              return Tab(text: data);
            }).toList(),
          ),
        ),
        body: TabBarView(
          children: dataTables.map((tableName) {
            return buildChildTabContent(tableName);
          }).toList(),
        ),
      ),
    );
  }

  Widget buildChildTabContent(String tabName) {
    if (tabName == 'Summary') {
      return buildSummaryTab();
    } else {
      return Container(child: Text('No Datas'));
    }
  }

  Widget buildSummaryTab() {
    return Container(child: Text(widget.monster.description));
  }
}
