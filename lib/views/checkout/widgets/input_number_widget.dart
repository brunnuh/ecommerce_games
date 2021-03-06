import 'package:ecommerce_games/controllers/checkout_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class InputNumberWidget extends StatelessWidget {
  CheckoutController checkoutController = GetIt.I<CheckoutController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 90,
      height: 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: GestureDetector(
              child: Container(
                child: Icon(
                  Icons.remove,
                  size: 25,
                ),
              ),
              onTap: checkoutController.remove,
            ),
          ),
          Observer(
            builder: (_) => Text(
              checkoutController.input.toString(),
              style: TextStyle(fontSize: 20),
            ),
          ),
          Expanded(
            child: GestureDetector(
              child: Icon(
                Icons.add,
                size: 25,
              ),
              onTap: checkoutController.add,
            ),
          ),
        ],
      ),
    );
  }
}
