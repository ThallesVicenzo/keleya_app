import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keleya_app/Widgets/rounded_buttons.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff5a4fd9),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 60,
                horizontal: 90,
              ),
              child: Column(
                children: [
                  Text(
                    'Are you already a Kaleya user?',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RoundedButton(
                        onPressed: null,
                        title: 'LogIn',
                        color: Color(0xff5a4fd9),
                        style: TextStyle(color: Colors.white),
                      ),
                      RoundedButton(
                        onPressed: null,
                        title: 'Register',
                        color: Color(0xfff3ecff),
                        style: TextStyle(
                          color: Color(0xff5a4fd9),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
