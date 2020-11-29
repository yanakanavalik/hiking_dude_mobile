// Flutter imports:
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Package imports:
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

// Project imports:
import '../../common/colors.dart';
import '../../common/text_styles.dart';

class LoginForm extends StatefulWidget {
  LoginForm();

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();

  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(children: <Widget>[
        const SizedBox(height: 40),
        _createFormTextField(
          hintText: 'Email',
          type: TextInputType.emailAddress,
          onSave: (value) => setState(() => _email = value),
        ),
        const SizedBox(height: 40),
        _createFormTextField(
          hintText: 'Password',
          type: TextInputType.visiblePassword,
          onSave: (value) => setState(() => _password = value),
        ),
        const SizedBox(height: 50),
        _createFormSubmitButton(),
        const SizedBox(height: 35),
        _createFormCancelButton(),
      ]),
    );
  }

  Widget _createFormTextField(
      {hintText = '', TextInputType type, Function(String) onSave}) {
    return TextFormField(
      cursorColor: AppColors.pink,
      decoration: InputDecoration(
        enabledBorder: _createBorder(false),
        focusedBorder: _createBorder(true),
        hintText: hintText,
        hintStyle: subtitleTS(color: AppColors.lightGray),
      ),
      style: subtitleTS(color: AppColors.middleGray),
      keyboardType: type,
      obscureText: type == TextInputType.visiblePassword,
      onSaved: onSave,
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    );
  }

  OutlineInputBorder _createBorder(isActive) {
    final borderColor = isActive ? AppColors.pink : AppColors.pinkLight;
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(15.0)),
      borderSide: BorderSide(color: borderColor),
    );
  }

  Widget _createFormSubmitButton() {
    return _createFormButton(true, 'Submit', _submitForm);
  }

  Widget _createFormCancelButton() {
    return _createFormButton(false, 'Cancel', () => Navigator.pop(context));
  }

  Widget _createFormButton(
      bool isSubmitButton, String title, VoidCallback onPressedHandler) {
    final mainColor = isSubmitButton ? AppColors.pink : AppColors.lightGray;

    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
        side: BorderSide(color: mainColor),
      ),
      padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 65.0),
      color: mainColor,
      onPressed: onPressedHandler,
      child: Text(title, style: subtitleTS(color: AppColors.white)),
    );
  }

  Future _submitForm() async {
    _formKey.currentState.save();

    if (_formKey.currentState.validate()) {
      try {
        final app = await Firebase.initializeApp();
        var auth = FirebaseAuth.instanceFor(app: app);
        var userCredential = await auth.signInWithEmailAndPassword(
            email: _email, password: _password);

        if (userCredential != null) {
          Navigator.pushReplacementNamed(context, '/main');
        }
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          print('The password provided is too weak.');
        } else if (e.code == 'email-already-in-use') {
          print('The account already exists for that email.');
        }
      } catch (e) {
        print(e);
      }
    }
  }
}
