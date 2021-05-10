import 'package:ecommerce_games/controllers/product_controller.dart';
import 'package:ecommerce_games/views/cart/cart_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icons.dart';

class AppBarWidget extends PreferredSize {
  ProductController productController = GetIt.I<ProductController>();
  TextEditingController searchController = TextEditingController();

  @override
  Size get preferredSize => Size.fromHeight(190);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Ola, Bem-vindo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.shopping_cart_outlined,
                      size: 25,
                      color: Colors.grey,
                    ),
                    onPressed: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (_) => CartView(),
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Observer(
                      // verifica qual tipo esta selecionado e seta o icone especifico
                      builder: (_) => Icon(
                        productController.filterTypeActive ==
                                whatFilterActive.DEFAULT
                            ? LineIcons.filter
                            : productController.filterTypeActive ==
                                    whatFilterActive.PRICE
                                ? LineIcons.dollarSign
                                : productController.filterTypeActive ==
                                        whatFilterActive.NAME
                                    ? LineIcons.font
                                    : LineIcons.star,
                        size: 25,
                        color: Colors.grey,
                      ),
                    ),
                    onPressed: () {
                      return showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: Text("Filtrar por:"),
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                InkWell(
                                  onTap: () {
                                    productController.filterPrice();
                                    Navigator.of(context).pop();
                                  },
                                  child: ListTile(
                                    leading: Icon(LineIcons.dollarSign),
                                    title: Text("Preço"),
                                    trailing: Observer(
                                      builder: (_) => Icon(
                                        productController.filterOrderBy ==
                                                    FilterOrderBy.DOWN &&
                                                productController
                                                        .filterTypeActive ==
                                                    whatFilterActive.PRICE
                                            ? LineIcons.sortNumericDown
                                            : LineIcons.sortNumericUp,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    productController.filterScore();
                                    Navigator.of(context).pop();
                                  },
                                  child: ListTile(
                                    leading: Icon(LineIcons.star),
                                    title: Text("Popularidade"),
                                    trailing: Observer(
                                      builder: (_) => Icon(
                                        productController.filterOrderBy ==
                                                    FilterOrderBy.DOWN &&
                                                productController
                                                        .filterTypeActive ==
                                                    whatFilterActive.SCORE
                                            ? LineIcons.sortAmountDown
                                            : LineIcons.sortAmountUp,
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    productController.filterName();
                                    Navigator.of(context).pop();
                                  },
                                  child: ListTile(
                                    leading: Icon(LineIcons.font),
                                    title: Text("Nome"),
                                    trailing: Observer(
                                      builder: (_) => Icon(
                                        productController.filterOrderBy ==
                                                    FilterOrderBy.DOWN &&
                                                productController
                                                        .filterTypeActive ==
                                                    whatFilterActive.NAME
                                            ? LineIcons.sortAlphabeticalDown
                                            : LineIcons.sortAlphabeticalUp,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                  )
                ],
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            height: 55,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Observer(
              builder: (_) {
                return TextField(
                  controller: searchController,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      productController.resetKeyWords();
                    } else {
                      productController.setKeyWords(value);
                    }
                  },
                  decoration: InputDecoration(
                    hintText: "Buscar Jogo",
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    suffixIcon: productController.keyWords != null
                        ? IconButton(
                            icon: Icon(Icons.clear),
                            onPressed: () {
                              searchController.clear();
                              productController.resetKeyWords();
                            },
                          )
                        : Container(),
                    icon: Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.blue.shade100,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
