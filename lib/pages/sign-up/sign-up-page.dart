import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hiking_dude_mobile/common/colors.dart';
import 'package:hiking_dude_mobile/common/text-styles.dart';
import 'package:hiking_dude_mobile/elements/back-button.dart';
import 'package:hiking_dude_mobile/widgets/sign-up-form/sign-up-form.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage();

  @override
  SignUpPageState createState() => SignUpPageState();
}

class SignUpPageState extends State<SignUpPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: BackArrowButton(),
              title: Text('Sign in', style: titleTS(color: AppColors.pink)),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Text(
                    'Please, enter some info for your account:',
                    style: titleTS(color: AppColors.middleGray),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  SignUpForm(),
                ],
              ),
            )),
      ),
    );
  }
}
