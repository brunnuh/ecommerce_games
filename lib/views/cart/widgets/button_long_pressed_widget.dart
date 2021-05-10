import 'package:ecommerce_games/controllers/product_controller.dart';
import 'package:ecommerce_games/helpers/extensions.dart';
import 'package:ecommerce_games/views/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icons.dart';

class ButtonLongPressedWidget extends StatelessWidget {
  ProductController productController = GetIt.I<ProductController>();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onLongPress: () {
        productController.clearCart();

        return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Icon(
                LineIcons.check,
                color: Colors.green,
                size: 35,
              ),
              content: Text("Compra efetuada com sucesso!"),
              actions: [
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (_) => HomeView(),
                        ),
                        (route) => false);
                  },
                  child: Text("Ok"),
                )
              ],
            );
          },
        );
      },
      child: Observer(
        builder: (_) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    productController.getTotPriceCart.toReal(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              Text(
                productController.freeShipping,
                style: TextStyle(color: Colors.white),
              ),
            ],
          );
        },
      ),
    );
  }
}
