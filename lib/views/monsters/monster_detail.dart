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
    final weaknessDatas = [
      ['Fire', 'element', widget.monster.weaknessFire],
      ['Dragon', 'element', widget.monster.weaknessDragon],
      ['Ice', 'element', widget.monster.weaknessIce],
      ['Thunder', 'element', widget.monster.weaknessThunder],
      ['Water', 'element', widget.monster.weaknessWater],
      ['Blast', 'status', widget.monster.weaknessBlast],
      ['Paralysis', 'status', widget.monster.weaknessParalysis],
      ['Poison', 'status', widget.monster.weaknessPoison],
      ['Sleep', 'status', widget.monster.weaknessSleep],
      ['Stun', 'status', widget.monster.weaknessStun],
    ];

    //Summary Tab:
    // --> Monster Descriptions
    // ------------------------------
    // --> Monster Weakness (List)
    // -----> Weakness name : Weakness Img * Monster Weakness number
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 20.0, 0, 20.0),
          child: Container(child: Text(widget.monster.description)),
        ),
        DottedLine(),
        Expanded(
          child: ListView.builder(
            itemCount: weaknessDatas.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 3,
                          child: Text(
                            weaknessDatas[index][0],
                            style: TextStyle(fontSize: 20.0),
                          ),
                        ),
                        Expanded(
                          child: renderWeaknessValue(weaknessDatas[index]),
                        ),
                      ],
                    ),
                  ),
                  DottedLine(),
                ],
              );
            },
          ),
        )
      ],
    );
  }

  Widget renderWeaknessValue(List<dynamic> weakness) {
    return Row(
      children: new List.generate(
        weakness[2],
        (index) => Container(
          child: Image(
            image: AssetImage(
                'assets/images/ui/ic_${weakness[1] == 'element' ? 'element' : 'status'}_${weakness[0].toLowerCase()}.png'),
            height: 25.0,
          ),
        ),
      ),
    );
  }
}
