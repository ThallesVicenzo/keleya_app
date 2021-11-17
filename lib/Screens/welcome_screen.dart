import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:keleya_app/Widgets/rounded_buttons.dart';
import 'package:keleya_app/routes/named_routes.dart';
import 'package:keleya_app/widgets/white_menu.dart';
import 'package:keleya_app/constants.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kThemeColor,
      body: SafeArea(
        child: WhiteMenu(
          title: 'Are you already a Keleya user?',
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RoundedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      NamedRoutes.signIn,
                    );
                  },
                  title: 'LogIn',
                  color: kThemeColor,
                  style: TextStyle(color: Colors.white),
                ),
                RoundedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      NamedRoutes.signUp,
                    );
                  },
                  title: 'Register',
                  color: Color(0xfff3ecff),
                  style: TextStyle(
                    color: kThemeColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
