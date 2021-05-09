import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class AddRemoveWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Icon(LineIcons.removeFormat),
        )
      ],
    );
  }
}
