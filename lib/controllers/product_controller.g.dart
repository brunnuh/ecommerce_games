// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProductController on _ProductController, Store {
  Computed<double> _$getTotPriceCartComputed;

  @override
  double get getTotPriceCart => (_$getTotPriceCartComputed ??= Computed<double>(
          () => super.getTotPriceCart,
          name: '_ProductController.getTotPriceCart'))
      .value;
  Computed<String> _$freeShippingComputed;

  @override
  String get freeShipping =>
      (_$freeShippingComputed ??= Computed<String>(() => super.freeShipping,
              name: '_ProductController.freeShipping'))
          .value;

  final _$filterTypeActiveAtom =
      Atom(name: '_ProductController.filterTypeActive');

  @override
  whatFilterActive get filterTypeActive {
    _$filterTypeActiveAtom.reportRead();
    return super.filterTypeActive;
  }

  @override
  set filterTypeActive(whatFilterActive value) {
    _$filterTypeActiveAtom.reportWrite(value, super.filterTypeActive, () {
      super.filterTypeActive = value;
    });
  }

  final _$filterOrderByAtom = Atom(name: '_ProductController.filterOrderBy');

  @override
  FilterOrderBy get filterOrderBy {
    _$filterOrderByAtom.reportRead();
    return super.filterOrderBy;
  }

  @override
  set filterOrderBy(FilterOrderBy value) {
    _$filterOrderByAtom.reportWrite(value, super.filterOrderBy, () {
      super.filterOrderBy = value;
    });
  }

  final _$downPriceAtom = Atom(name: '_ProductController.downPrice');

  @override
  bool get downPrice {
    _$downPriceAtom.reportRead();
    return super.downPrice;
  }

  @override
  set downPrice(bool value) {
    _$downPriceAtom.reportWrite(value, super.downPrice, () {
      super.downPrice = value;
    });
  }

  final _$downNameAtom = Atom(name: '_ProductController.downName');

  @override
  bool get downName {
    _$downNameAtom.reportRead();
    return super.downName;
  }

  @override
  set downName(bool value) {
    _$downNameAtom.reportWrite(value, super.downName, () {
      super.downName = value;
    });
  }

  final _$downScoreAtom = Atom(name: '_ProductController.downScore');

  @override
  bool get downScore {
    _$downScoreAtom.reportRead();
    return super.downScore;
  }

  @override
  set downScore(bool value) {
    _$downScoreAtom.reportWrite(value, super.downScore, () {
      super.downScore = value;
    });
  }

  final _$getProductsAsyncAction =
      AsyncAction('_ProductController.getProducts');

  @override
  Future<void> getProducts() {
    return _$getProductsAsyncAction.run(() => super.getProducts());
  }

  final _$_ProductControllerActionController =
      ActionController(name: '_ProductController');

  @override
  void filterPrice() {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.filterPrice');
    try {
      return super.filterPrice();
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterName() {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.filterName');
    try {
      return super.filterName();
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void filterScore() {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.filterScore');
    try {
      return super.filterScore();
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addCart(Product product, {int qtd}) {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.addCart');
    try {
      return super.addCart(product, qtd: qtd);
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCart(Product product) {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.removeCart');
    try {
      return super.removeCart(product);
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearCart() {
    final _$actionInfo = _$_ProductControllerActionController.startAction(
        name: '_ProductController.clearCart');
    try {
      return super.clearCart();
    } finally {
      _$_ProductControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
filterTypeActive: ${filterTypeActive},
filterOrderBy: ${filterOrderBy},
downPrice: ${downPrice},
downName: ${downName},
downScore: ${downScore},
getTotPriceCart: ${getTotPriceCart},
freeShipping: ${freeShipping}
    ''';
  }
}
