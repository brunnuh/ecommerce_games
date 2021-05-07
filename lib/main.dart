import 'package:ecommerce_games/views/home/home_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ecommerce Game',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0XFFe0e7ef),
        appBarTheme: AppBarTheme(
          color: Color(0XFFe0e7ef),
          elevation: 0,
          iconTheme: IconThemeData(
            color: Color(0XFF2f2f34),
          ),
        ),
      ),
      home: HomeView(),
    );
  }
}
