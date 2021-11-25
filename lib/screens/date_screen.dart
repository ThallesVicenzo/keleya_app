import 'package:flutter/material.dart';
import 'package:keleya_app/constants.dart';
import 'package:keleya_app/routes/named_routes.dart';
import 'package:keleya_app/utilities/input_formatter.dart';
import 'package:keleya_app/widgets/rounded_buttons.dart';
import 'package:keleya_app/widgets/title_widget.dart';

class DateScreen extends StatefulWidget {
  @override
  _DateScreenState createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {

  final dateFormatter = InputFormatter.date();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TitleWidget(
              title: 'When was your baby born?',
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                'This will help us give you relevant tips to care for yourself & your baby',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                inputFormatters: [dateFormatter],
                keyboardType: TextInputType.number,
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Type it here',
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
                    Navigator.pushNamed(context, NamedRoutes.success);
                  },);
                }
            ),
          ],
        ),
      ),
    );
  }
}
