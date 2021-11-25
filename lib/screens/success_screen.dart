import 'package:flutter/material.dart';
import 'package:keleya_app/widgets/title_widget.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TitleWidget(title: 'Congratulations on your new arrival!',),
            Image.asset('assets/images/baby.png'),
          ],
        ),
      ),
    );
  }
}
