import 'package:flutter/material.dart';
import 'package:hiking_dude_mobile/assets/icons/my_flutter_app_icons.dart'
    as CustomIcons;

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hiking dude'),
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(CustomIcons.MyFlutterApp.menu),
            iconSize: 32,
            padding: const EdgeInsets.all(20.0),
            color: Color(0xffFF485A),
            onPressed: () => Navigator.pushNamed(context, '/menu'),
          ),
        ],
      ),
      body: Center(
        child: Container(
          child: MaterialButton(
            onPressed: () => Navigator.pushNamed(context, '/menu'),
            minWidth: 185,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18.0),
                side: BorderSide(color: Color(0xffFF485A))),
            color: Color(0xffFF485A),
            textColor: Colors.white,
            child: Text('Start'),
          ),
        ),
      ),
    );
  }
}
