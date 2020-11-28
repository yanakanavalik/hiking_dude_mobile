import 'package:flutter/material.dart';
import 'package:hiking_dude_mobile/common/colors.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:hiking_dude_mobile/pages/home/index.dart' as HomePage;
import 'package:hiking_dude_mobile/pages/menu/menu-page.dart' as MenuPage;
import 'package:hiking_dude_mobile/pages/login/login-page.dart' as LogInPage;
import 'package:hiking_dude_mobile/pages/onboarding/onboarding-page.dart'
    as OnboardingPage;

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
          '/': (context) => OnboardingPage.Onboarding(),
          '/home': (context) => HomePage.Home(),
          '/menu': (context) => MenuPage.Menu(),
          '/login': (context) => LogInPage.LogIn(),
          '/boards': (context) => MenuPage.Menu(),
        },
        theme: theme.copyWith(
          backgroundColor: AppColors.white,
          appBarTheme: AppBarTheme(
            elevation: 0,
            textTheme: theme.textTheme.copyWith(
              title: theme.textTheme.title.copyWith(fontSize: 20.0),
            ),
            iconTheme: theme.iconTheme,
          ),
        ));
  }
}
