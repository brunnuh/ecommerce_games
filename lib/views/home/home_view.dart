import 'package:ecommerce_games/controllers/product_controller.dart';
import 'package:ecommerce_games/models/product.dart';
import 'package:ecommerce_games/views/home/widgets/app_bar_widget.dart';
import 'package:ecommerce_games/views/home/widgets/product_about_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

class HomeView extends StatelessWidget {
  ProductController productController = GetIt.I<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        child: Observer(
          builder: (_) {
            return productController.listProducts.isNotEmpty
                ? ListView.builder(
                    itemCount: productController.listProducts.length,
                    padding: const EdgeInsets.only(bottom: 10),
                    itemBuilder: (_, index) {
                      Product product = productController.listProducts[index];
                      return ProductAboutWidget(
                        product: product,
                      );
                    },
                  )
                : Center(
                    child: CircularProgressIndicator(),
                  );
          },
        ),
      ),
    );
  }
}
