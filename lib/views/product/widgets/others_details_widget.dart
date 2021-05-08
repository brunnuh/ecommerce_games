import 'package:flutter/material.dart';

class OthersDetailsWidget extends StatelessWidget {
  final String title;
  final IconData iconData;
  final String traling;

  OthersDetailsWidget({this.title, this.iconData, this.traling});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: ListTile(
        leading: Icon(
          iconData,
          color: Colors.grey,
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
        trailing: Text(
          traling,
          style: TextStyle(fontWeight: FontWeight.w300),
        ),
      ),
    );
  }
}
