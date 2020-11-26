import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.close),
            iconSize: 32,
            padding: const EdgeInsets.all(20.0),
            color: Color(0xffFF485A),
            onPressed: () => Navigator.pushNamed(context, '/'),
          ),
        ],
      ),
      body: MenuBody(),
    );
  }
}

class MenuBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            FlatButton(
              child: Text('Explore boards'),
              onPressed: () => {},
            ),
            FlatButton(
              child: Text('Go to cabinet'),
              onPressed: () => Navigator.pushNamed(context, '/login'),
            ),
            FlatButton(
              child: Text('Create trip'),
              onPressed: () => {},
            )
          ],
        ),
      ),
    );
  }
}
