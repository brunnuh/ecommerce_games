import 'package:ecommerce_games/controllers/checkout_controller.dart';
import 'package:ecommerce_games/controllers/product_controller.dart';
import 'package:ecommerce_games/helpers/extensions.dart';
import 'package:ecommerce_games/models/product.dart';
import 'package:ecommerce_games/views/cart/cart_view.dart';
import 'package:ecommerce_games/views/checkout/widgets/input_number_widget.dart';
import 'package:ecommerce_games/views/checkout/widgets/text_value_widget.dart';
import 'package:ecommerce_games/views/shared/floating_button_widget.dart';
import 'package:ecommerce_games/views/shared/row_product_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class CheckoutView extends StatelessWidget {
  final Product product;
  ProductController productController = GetIt.I<ProductController>();
  CheckoutController checkoutController = GetIt.I<CheckoutController>();

  CheckoutView({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Checkout",
          style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Item(s)",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            RowProductWidget(
              product: product,
            ),
            const SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Pagamento",
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextValueWidget(
              title: "Item",
              value: product.price.toReal(),
            ),
            TextValueWidget(title: "Frete", value: "R\$ 10,00"),
            TextValueWidget(
              title: "Sub Total",
              value: (product.price + 10).toReal(),
            ),
            TextValueWidget(
              title: "Total",
              value: (product.price + 10).toReal(),
            ),
            ListTile(
              leading: Text(
                "Qtd.",
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                ),
              ),
              trailing: InputNumberWidget(),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingButtonWidget(
        title: "Adicionar ao carrinho",
        onTap: () async {
          productController.addCart(product, qtd: checkoutController.input);
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => CartView(),
            ),
          );
          await Future.delayed(Duration(seconds: 2));
          checkoutController.reset();
        },
      ),
    );
  }
}
