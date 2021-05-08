import 'package:ecommerce_games/models/product.dart';
import 'package:flutter/material.dart';

class ProductView extends StatelessWidget {
  final Product product;

  ProductView({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}
