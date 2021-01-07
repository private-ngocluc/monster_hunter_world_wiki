part of './views.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: AlignmentDirectional.centerEnd,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/dashboard_bg.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Center(
        child: GridView.count(
          crossAxisCount: 3,
          children: [
            Container(
              margin: EdgeInsets.all(15),
              child: new MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: new Text("Controls"),
                splashColor: Colors.redAccent,
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: new MaterialButton(
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: new Text("World"),
                splashColor: Colors.redAccent,
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(15.0),
              child: GestureDetector(
                  child: Container(
                      padding: EdgeInsets.fromLTRB(0, 100, 0, 0),
                      decoration: BoxDecoration(
                        color: Colors.blueGrey[200],
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/ui/ic_ui_elderseal.png"),
                            fit: BoxFit.cover),
                      ),
                      child: Center(
                          child: Stack(
                        children: <Widget>[
                          // Stroked text as border.
                          Text(
                            'Monsters',
                            style: TextStyle(
                              fontSize: 14,
                              foreground: Paint()
                                ..style = PaintingStyle.stroke
                                ..strokeWidth = 3
                                ..color = Colors.black,
                              decoration: TextDecoration.none,
                            ),
                          ),
                          // Solid text as fill.
                          Text(
                            'Monsters',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.yellow[800],
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ))),
                  onTap: () {
                    Navigator.pushNamed(context, monsterListRoute);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
