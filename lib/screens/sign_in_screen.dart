import 'package:flutter/material.dart';
import 'package:keleya_app/routes/named_routes.dart';
import 'package:keleya_app/widgets/rounded_buttons.dart';
import 'package:keleya_app/widgets/white_menu.dart';
import 'package:keleya_app/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String password;
  String email;
  bool isPasswordVisible = false;
  final _auth = FirebaseAuth.instance;

  void getCurrentUser() {
    final user = _auth.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeColor,
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
                  counterText: 'Forgot your password?',
                  counterStyle: TextStyle(
                    color: kThemeColor,
                    fontSize: 13,
                  ),
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
              RoundedButton(
                title: 'Sign In',
                style: TextStyle(color: Colors.white, fontSize: 18,),
                color: kThemeColor,
                onPressed: () async {
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, NamedRoutes.success);
                    }
                  } catch (e) {
                    print(e);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
