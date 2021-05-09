import 'package:ecommerce_games/controllers/product_controller.dart';
import 'package:ecommerce_games/models/product.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class AddRemoveWidget extends StatefulWidget {
  Product product;

  AddRemoveWidget({this.product});

  @override
  _AddRemoveWidgetState createState() => _AddRemoveWidgetState();
}

class _AddRemoveWidgetState extends State<AddRemoveWidget> {
  ProductController productController = GetIt.I<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          child: Icon(Icons.remove),
          onTap: () {
            if (widget.product.qtd >= 0) {
              productController.removeCart(widget.product);
              setState(() {
                widget.product = widget.product;
              });
            }
          },
        ),
        Text(widget.product.qtd.toString()),
        GestureDetector(
          child: Icon(Icons.add),
          onTap: () {
            productController.addCart(widget.product, qtd: 1);
            setState(() {
              widget.product = widget.product;
            });
          },
        ),
      ],
    );
  }
}
