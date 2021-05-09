import 'package:ecommerce_games/helpers/extensions.dart';
import 'package:ecommerce_games/models/product.dart';
import 'package:ecommerce_games/views/checkout/checkout_view.dart';
import 'package:ecommerce_games/views/product/widgets/others_details_widget.dart';
import 'package:ecommerce_games/views/product/widgets/top_information_widget.dart';
import 'package:ecommerce_games/views/shared/floating_button_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ProductView extends StatelessWidget {
  final Product product;

  ProductView({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              TopInformationWidget(
                product: product,
              ),
              const SizedBox(
                height: 10,
              ),
              OthersDetailsWidget(
                title: "Estoque",
                iconData: Icons.store_mall_directory,
                traling: "x${product.id}", // so para representar
              ),
              OthersDetailsWidget(
                title: "Peso",
                iconData: LineIcons.weight,
                traling: "58g",
              ),
              Card(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    product.content,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingButtonWidget(
        onTap: () {
          Navigator.of(context).push(
            CupertinoPageRoute(
              builder: (_) => CheckoutView(
                product: product,
              ),
            ),
          );
        },
        title: "Comprar por " + product.price.toReal(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
