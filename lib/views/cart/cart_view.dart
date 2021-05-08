import 'package:ecommerce_games/controllers/product_controller.dart';
import 'package:ecommerce_games/models/product.dart';
import 'package:ecommerce_games/views/shared/row_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CartView extends StatelessWidget {
  ProductController productController = GetIt.I<ProductController>();

  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Carrinho",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pushNamedAndRemoveUntil(
                context, "HomeView", (route) => false)),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView.builder(
              itemBuilder: (_, index) {
                if (index >= productController.cartCheckout.length) {
                  return SizedBox(
                    height: 100,
                  );
                }
                Product product = productController.cartCheckout[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  child: RowProductWidget(
                    product: product,
                    isCheckout: true,
                  ),
                );
              },
              itemCount: productController.cartCheckout.length + 1,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              color: Color.fromRGBO(0, 0, 0, .6),
              width: _size.width,
              height: 100,
              child: InkWell(
                onLongPress: () {
                  return showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Compra efetuada com sucesso!"),
                      );
                    },
                  );
                },
                child: Row(
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
                      "R\$ 123,00",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}