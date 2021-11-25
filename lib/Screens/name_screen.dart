import 'package:flutter/material.dart';
import 'package:keleya_app/constants.dart';
import 'package:keleya_app/routes/named_routes.dart';
import 'package:keleya_app/widgets/rounded_buttons.dart';
import 'package:keleya_app/widgets/title_widget.dart';

class NameScreen extends StatefulWidget {
  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TitleWidget(
              title: 'What should we call you?',
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  name = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Type you nickname here',
                ),
              ),
            ),
            RoundedButton(
              title: 'Next question',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
              color: kThemeColor,
              onPressed: (){
                setState(() {
                  Navigator.pushNamed(context, NamedRoutes.date);
                },);
              }
            ),
          ],
        ),
      ),
    );
  }
}
