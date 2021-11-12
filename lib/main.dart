import 'package:flutter/material.dart';
import 'package:keleya_app/routes/named_routes.dart';
import 'package:keleya_app/routes/pages.dart';
import 'Screens/welcome_screen.dart';

void main() {
  runApp(KeleyaApp());
}

class KeleyaApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(initialRoute: NamedRoutes.home, routes: Pages.all(context),);
  }

}

