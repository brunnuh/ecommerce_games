import 'dart:convert';

import 'package:ecommerce_games/models/product.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

part 'product_controller.g.dart';

class ProductController = _ProductController with _$ProductController;

// ordenado de cima para baixo, ou de baixo para cima, ou nenhum
enum FilterOrderBy { NONE, UP, DOWN }

// qual tipo esta selecionado
enum whatFilterActive { DEFAULT, PRICE, NAME, SCORE }

abstract class _ProductController with Store {
  // pega produtos ao ser chamado no main
  _ProductController() {
    getProducts();
  }

  // Observers
  ObservableList<Product> listProducts = ObservableList<Product>();

  // qual filtro esta ativado
  @observable
  whatFilterActive filterTypeActive = whatFilterActive.DEFAULT;

  // filtro do preco - ordem crescente: true | ordem decrescente: false
  @observable
  FilterOrderBy filterOrderBy = FilterOrderBy.NONE;

  // Action

  // pega produtos do json e serializa para um modelo
  @action
  Future<void> getProducts() async {
    listProducts.clear();
    final String productsJson = await _loadJson();
    final productsDecode = json.decode(productsJson);
    List<Product> products = [];

    productsDecode.forEach((element) {
      products.add(Product.fromJson(element));
    });

    listProducts.addAll(products);
  }

  // carrega json
  Future _loadJson() async {
    return await rootBundle.loadString("assets/data/products.json");
  }

  /// se down true ? entao ordena o preço do menor para o maior
  /// se down false ? entao ordena o preco de maior paro o menor

  @observable
  bool downPrice = true;

  // filtrando por preco
  @action
  void filterPrice() {
    downName = true;
    downScore = true;
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

  // filtrando por nome
  @action
  void filterName() {
    downPrice = true;
    downScore = true;

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

  @observable
  bool downScore = true;

  //filtrando por score
  @action
  void filterScore() {
    downPrice = true;
    downName = true;

    filterTypeActive = whatFilterActive.SCORE;

    if (downName && filterOrderBy != FilterOrderBy.DOWN) {
      filterOrderBy = FilterOrderBy.DOWN;
      listProducts.sort(
        (a, b) {
          if (a.score > b.score) {
            return 1;
          }
          return -1;
        },
      );
    } else {
      filterOrderBy = FilterOrderBy.UP;
      listProducts.sort(
        (a, b) {
          if (a.score < b.score) {
            return 1;
          }
          return -1;
        },
      );
    }
  }

  ObservableList<Product> cartCheckout = ObservableList<Product>();

  // adicionar produtos ao carrinho
  @action
  void addCart(Product product, {int qtd = 1}) {
    if (cartCheckout.contains(product)) {
      cartCheckout.remove(product);
      product.qtd += qtd;
    } else {
      product.qtd = qtd;
    }
    cartCheckout.add(product);
  }

  // remover produtos do carrinho
  @action
  void removeCart(Product product) {
    if (cartCheckout.contains(product)) {
      cartCheckout.remove(product);
      if (product.qtd > 1) {
        product.qtd -= 1;
        cartCheckout.add(product);
      }
    }
  }

  // limpar carrinho
  @action
  void clearCart() => cartCheckout.clear();

//Computed
  // pegar o total do carrinho
  @computed
  double get getTotPriceCart {
    double totPrice = 0.0;
    // somar a qtd * preco de cada produto
    cartCheckout.forEach((element) {
      totPrice += element.qtd * element.price;
    });
    if (totPrice < 250) {
      // somar a cada produto 10 de frete caso o total seja menor que 250
      cartCheckout.forEach((element) {
        totPrice += element.qtd * 10;
      });
    }
    return totPrice;
  }

  // verificar se o frete gratis
  @computed
  String get freeShipping {
    double totPrice = 0.0;
    cartCheckout.forEach((element) {
      totPrice += element.qtd * element.price;
    });
    if (totPrice > 250) {
      return "Frete Gratis";
    }
    return "";
  }

  @observable
  String keyWords;

  @action
  void setKeyWords(String value) => keyWords = value;

  @action
  void resetKeyWords() => keyWords = null;

  // buscar jogos e devolver uma lista
  @computed
  List<Product> get searchProducts {
    List<Product> searchList = [];
    if (keyWords != null && keyWords.isNotEmpty) {
      listProducts.forEach(
        (Product element) {
          if (element.name.toLowerCase().contains(keyWords.toLowerCase(), 0) ==
              true) {
            searchList.add(element);
          }
        },
      );
    }
    return searchList;
  }
}
