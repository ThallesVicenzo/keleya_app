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
  bool isChecked = false;
  bool isPasswordVisible = false;
  final _auth = FirebaseAuth.instance;

  Future <void> verifyForm(BuildContext context) async {
    if (password == confirmPassword) {
      try {
        final newUser = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
        if (newUser != null) {
          Navigator.pushNamed(context, NamedRoutes.name);
        }
      } catch (e) {
        print(e);
      }
    } else {
      showSnackBar(context, 'Password does not match');
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
      backgroundColor: kThemeColor,
      body: SafeArea(
        child: WhiteMenu(
          title: 'Welcome to Keleya mama!',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Create an account',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              TextField(
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Type your email here ',
                ),
              ),
              TextField(
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
              TextField(
                onChanged: (value) => confirmPassword = value,
                obscureText: isPasswordVisible,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Confirm your password here',
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
              Checkbox(
                tristate: false,
                value: isChecked,
                onChanged: (bool value) {
                  setState(() {
                    isChecked = value;
                  });
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
