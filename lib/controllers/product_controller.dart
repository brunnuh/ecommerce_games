import 'dart:convert';

import 'package:ecommerce_games/models/product.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = _ProductController with _$ProductController;

enum FilterOrderBy { NONE, UP, DOWN }

enum whatFilterActive { DEFAULT, PRICE, NAME, SCORE }

abstract class _ProductController with Store {
  // Observers
  ObservableList<Product> listProducts = ObservableList<Product>();

  // qual filtro esta ativado
  @observable
  whatFilterActive filterTypeActive = whatFilterActive.DEFAULT;

  // filtro do preco - ordem crescente: true | ordem decrescente: false
  @observable
  FilterOrderBy filterOrderBy = FilterOrderBy.NONE;

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

  /// se down true ? entao ordena o preço do menor para o maior
  /// se down false ? entao ordena o preco de maior paro o menor

  @observable
  bool downPrice = true;

  @action
  void filterPrice() {
    filterTypeActive = whatFilterActive.PRICE;

    if (downPrice && filterOrderBy != FilterOrderBy.DOWN) {
      filterOrderBy = FilterOrderBy.DOWN;
      listProducts.sort(
        (a, b) {
          if (a.price > b.price) {
            return 1;
          }
          return -1;
        },
      );
    } else {
      filterOrderBy = FilterOrderBy.UP;
      listProducts.sort(
        (a, b) {
          if (a.price < b.price) {
            return 1;
          }
          return -1;
        },
      );
    }
  }

  @observable
  bool downName = true;

  @action
  void filterName() {
    filterTypeActive = whatFilterActive.NAME;

    if (downName && filterOrderBy != FilterOrderBy.DOWN) {
      filterOrderBy = FilterOrderBy.DOWN;
      listProducts.sort(
        (a, b) => a.name.compareTo(b.name),
      );
    } else {
      filterOrderBy = FilterOrderBy.UP;
      listProducts.sort(
        (a, b) => b.name.compareTo(a.name),
      );
    }
  }

  //Computed

}
