import 'package:ecommerce_games/helpers/extensions.dart';
import 'package:ecommerce_games/models/product.dart';
import 'package:ecommerce_games/views/product/widgets/others_details_widget.dart';
import 'package:ecommerce_games/views/product/widgets/top_information_widget.dart';
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
                title: "quantidade",
                iconData: Icons.store_mall_directory,
                traling: "x${product.id}", // so para representar
              ),
              OthersDetailsWidget(
                title: "peso",
                iconData: LineIcons.weight,
                traling: "58g",
              ),
              const SizedBox(
                height: 20,
              ),
              Card(
                child: Padding(
                  child: Text(
                    product.content,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
              ),
              const SizedBox(
                height: 70,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 45,
        width: MediaQuery.of(context).size.width * 0.9,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.purple,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Text(
          "Comprar por " + product.price.toReal(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
