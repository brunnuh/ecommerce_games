import 'package:flutter/material.dart';

class TextValueWidget extends StatelessWidget {
  final String title;
  final String value;

  TextValueWidget({this.title, this.value});

  TextStyle _textStyle = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w400,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Text(
        title,
        style: _textStyle,
      ),
      trailing: Text(
        value,
        style: _textStyle,
      ),
    );
  }
}
