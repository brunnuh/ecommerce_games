import 'package:ecommerce_games/helpers/extensions.dart';
import 'package:ecommerce_games/models/product.dart';
import 'package:flutter/material.dart';

class RowProductWidget extends StatelessWidget {
  final Product product;
  final bool isCheckout;

  RowProductWidget({this.product, this.isCheckout = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            child: Image.asset(
              product.image,
              fit: BoxFit.contain,
              height: 65,
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          flex: 5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  product.name,
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
              ),
              Text.rich(
                TextSpan(
                  text: isCheckout ? product.qtd.toString() + "x " : "",
                  children: [
                    TextSpan(
                      text: product.price.toReal(),
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }
}
