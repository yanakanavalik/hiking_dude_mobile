// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Project imports:
import '../../common/colors.dart';
import '../../common/text_styles.dart';
import '../../elements/back_arrow_button.dart';
import '../../widgets/sign_up_form/sign_up_form.dart';

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
