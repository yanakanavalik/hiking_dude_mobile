import 'package:flutter/material.dart';
import 'package:hiking_dude_mobile/common/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hiking_dude_mobile/pages/menu/menu-page.dart';
import 'package:hiking_dude_mobile/pages/login/login-page.dart';
import 'package:hiking_dude_mobile/pages/onboarding/onboarding-page.dart';
import 'package:hiking_dude_mobile/pages/sign-up/sign-up-page.dart';
import 'pages/main-tabs/main-tabs.dart';

void main() {
  runApp(App());
}

class App extends StatefulWidget {
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  // Set default `_initialized` and `_error` state to false
  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();

      setState(() {
        _initialized = true;
      });
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (!_initialized) {
      return SizedBox();
    }

    ThemeData theme = ThemeData();
    return MaterialApp(
        title: 'Hiking dude',
        routes: {
          '/': (context) => Onboarding(),
          '/main': (context) => MainTabs(),
          '/login': (context) => LoginPage(),
          '/sign-in': (context) => SignUpPage(),
          '/boards': (context) => Menu(),
        },
        color: AppColors.white,
        theme: theme.copyWith(
          backgroundColor: AppColors.white,
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: AppColors.white,
            iconTheme: theme.iconTheme,
          ),
        ));
  }
}
