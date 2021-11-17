import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keleya_app/widgets/white_menu.dart';
import 'package:keleya_app/constants.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String password;
  String email;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5a4fd9),
      body: SafeArea(
        child: WhiteMenu(
          title: 'Great to have you back!',
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  'Sign in using your Keleya account info',
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
            ],
          ),
        ),
      ),
    );
  }
}
