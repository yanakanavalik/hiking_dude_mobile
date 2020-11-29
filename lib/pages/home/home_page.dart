// Flutter imports:
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hiking dude'),
        automaticallyImplyLeading: false,
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
