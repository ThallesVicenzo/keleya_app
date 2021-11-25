import 'package:flutter/material.dart';
import 'package:keleya_app/routes/named_routes.dart';
import 'package:keleya_app/widgets/white_menu.dart';
import 'package:keleya_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:keleya_app/widgets/rounded_buttons.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String email;
  String password;
  String confirmPassword;
  String separate = '&';
  bool isChecked = false;
  bool isCheckedTwo = false;
  bool isPasswordVisible = false;
  final _auth = FirebaseAuth.instance;

  Future<void> verifyForm(BuildContext context) async {
    if (password == confirmPassword) {
      if (isChecked && isCheckedTwo != false) {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        if (newUser != null) {
          Navigator.pushNamed(context, NamedRoutes.name);
        }
      }
      else {
        showSnackBar(context, 'Please, accept the terms');
      }
    } else {
      showSnackBar(context, 'Please match your password');
    }
}

  void showSnackBar(BuildContext context, String content) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kThemeColor,
        content: Text(content),
        duration: const Duration(seconds: 2),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kThemeColor,
      body: WhiteMenu(
        title: 'Welcome to Keleya mama!',
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.all(40),
                child: Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Type your email here ',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => password = value,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Type your password here ',
                    suffixIcon: IconButton(
                      icon: isPasswordVisible
                          ? Icon(Icons.visibility_off)
                          : Icon(Icons.visibility),
                      onPressed: () => setState(
                        () => isPasswordVisible = !isPasswordVisible,
                      ),
                    ),
                  ),
                  obscureText: isPasswordVisible,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value) => confirmPassword = value,
                  obscureText: isPasswordVisible,
                  decoration: kTextFieldDecoration.copyWith(
                    hintText: 'Confirm your password here',
                  ),
                ),
              ),
              RoundedButton(
                title: 'Create an account',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                color: kThemeColor,
                onPressed: () async => verifyForm(context),
              ),
              Row(
                children: [
                  Checkbox(
                    tristate: false,
                    value: isChecked,
                    onChanged: (bool value) {
                      setState(() {
                        isChecked = value;
                      });
                    },
                  ),
                  TermsText(
                    normalTitle: 'I accept the ',
                    decTitle: 'privacy policy',
                  )
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    tristate: false,
                    value: isCheckedTwo,
                    onChanged: (bool value) {
                      setState(() {
                        isCheckedTwo = value;
                      });
                    },
                  ),
                  TermsText(
                    normalTitle: 'I accept the ',
                    decTitle: 'terms & conditions $separate Keleya advice',
                  )
                ],
              ),
              Row(
                children: [
                  Text(
                    'Already have an Keleya account?',
                    style: TextStyle(
                      fontSize: 17,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(
                        () {
                          Navigator.pushNamed(context, NamedRoutes.signIn);
                        },
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: kThemeColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TermsText extends StatelessWidget {
  TermsText({this.decTitle, this.normalTitle});

  final String normalTitle;
  final String decTitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          normalTitle,
        ),
        Text(
          decTitle,
          style: TextStyle(
            color: kThemeColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
