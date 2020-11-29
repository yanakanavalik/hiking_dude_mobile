// Flutter imports:

// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:firebase_core/firebase_core.dart';

// Project imports:
import 'common/colors.dart';
import 'pages/login/login_page.dart';
import 'pages/main-tabs/main_tabs.dart';
import 'pages/onboarding/onboarding_page.dart';
import 'pages/sign_up/sign_up_page.dart';
import 'services/navigation/routes.dart';

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

    var theme = ThemeData();
    return MaterialApp(
        title: 'Hiking dude',
        routes: {
          Routes.main: (context) => MainTabs(),
          Routes.login: (context) => LoginPage(),
          Routes.signUp: (context) => SignUpPage(),
        },
        home: Onboarding(),
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
