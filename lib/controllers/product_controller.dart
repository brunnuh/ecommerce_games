import 'dart:convert';

import 'package:ecommerce_games/models/product.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = _ProductController with _$ProductController;

abstract class _ProductController with Store {
  // Observers
  ObservableList<Product> listProducts = ObservableList<Product>();

  // Action
  @action
  Future<void> getProducts() async {
    listProducts.clear();
    await Future.delayed(Duration(seconds: 2));
    final String productsJson = await _loadJson();
    final productsDecode = json.decode(productsJson);
    List<Product> products = [];

    productsDecode.forEach((element) {
      products.add(Product.fromJson(element));
    });

    listProducts.addAll(products);
  }

  Future _loadJson() async {
    return await rootBundle.loadString("assets/data/products.json");
  }

  //Computed

}
