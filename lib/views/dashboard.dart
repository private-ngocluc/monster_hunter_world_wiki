import 'package:flutter/material.dart';
import 'package:monster_hunter_world_wiki/utils/routes/routes.dart';

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
                height: 100.0,
                minWidth: 150.0,
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
                height: 100.0,
                minWidth: 150.0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: new Text("World"),
                splashColor: Colors.redAccent,
                onPressed: () {},
              ),
            ),
            Container(
              margin: EdgeInsets.all(15),
              child: new MaterialButton(
                height: 100.0,
                minWidth: 150.0,
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
                child: new Text("Monsters"),
                splashColor: Colors.redAccent,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, monsterListRoute);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
