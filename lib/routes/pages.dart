import 'package:flutter/cupertino.dart';
import 'package:keleya_app/Screens/welcome_screen.dart';
import 'package:keleya_app/routes/named_routes.dart';

class Pages {
  static Map<String, WidgetBuilder> all(BuildContext context) {
    return {
      NamedRoutes.home: (context) => WelcomeScreen(),
    };
  }
}
