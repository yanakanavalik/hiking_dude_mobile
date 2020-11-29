// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Project imports:
import '../../common/colors.dart';
import '../../common/text_styles.dart';
import '../../elements/back_arrow_button.dart';
import '../../widgets/login_form/login_form.dart';

class LoginPage extends StatefulWidget {
  LoginPage();

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.white,
      child: SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              leading: BackArrowButton(),
              title: Text('Login', style: titleTS(color: AppColors.pink)),
              centerTitle: true,
              backgroundColor: Colors.transparent,
            ),
            body: SingleChildScrollView(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  Text(
                    'Please, enter your email and password:',
                    style: titleTS(color: AppColors.middleGray),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  LoginForm(),
                ],
              ),
            )),
      ),
    );
  }
}
