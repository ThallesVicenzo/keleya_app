import 'package:flutter/material.dart';
import 'package:keleya_app/Screens/welcome_screen.dart';
import 'package:keleya_app/routes/named_routes.dart';
import 'package:keleya_app/screens/date_screen.dart';
import 'package:keleya_app/screens/sign_in_screen.dart';
import 'package:keleya_app/screens/sign_up_screen.dart';
import 'package:keleya_app/screens/success_screen.dart';
import 'package:keleya_app/screens/name_screen.dart';

class Pages {
  static Map<String, WidgetBuilder> all(BuildContext context) {
    return {
      NamedRoutes.home: (context) => WelcomeScreen(),
      NamedRoutes.signIn: (context) => SignInScreen(),
      NamedRoutes.signUp: (context) => SignUpScreen(),
      NamedRoutes.success: (context) => SuccessScreen(),
      NamedRoutes.name: (context) => NameScreen(),
      NamedRoutes.date: (context) => DateScreen(),
    };
  }
}
