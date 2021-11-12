import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  RoundedButton({this.color, @required this.title, @required this.onPressed, this.style});

  final Color color;
  final String title;
  final Function onPressed;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Material(
        elevation: 1,
        color: color,
        borderRadius: BorderRadius.circular(15.0),
        child: MaterialButton(
          onPressed: onPressed,
          child: Center(
            child: Text(
              title,
              style: style,
            ),
          ),
        ),
      ),
    );
  }
}