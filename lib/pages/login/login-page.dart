import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiking_dude_mobile/assets/icons/my_flutter_app_icons.dart'
    as CustomIcons;

class LogIn extends StatelessWidget {
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
      body: LoginBody(),
    );
  }
}

class LoginBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: LogInForm(),
    );
  }
}

class LogInForm extends StatefulWidget {
  @override
  LogInFormState createState() {
    return LogInFormState();
  }
}

class LogInFormState extends State<LogInForm> {
  final _formKey = GlobalKey<FormState>();
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(_printLatestValue);
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the
    // widget tree.
    myController.dispose();
    super.dispose();
  }

  _printLatestValue() {
    print("Second text field: ${myController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter your name'),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: (text) {
              print("First text field: $text");
            },
            controller: myController,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: RaisedButton(
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ]));
  }
}
