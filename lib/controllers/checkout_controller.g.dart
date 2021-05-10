// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckoutController on _CheckoutController, Store {
  Computed<String> _$freeShippingComputed;

  @override
  String get freeShipping =>
      (_$freeShippingComputed ??= Computed<String>(() => super.freeShipping,
              name: '_CheckoutController.freeShipping'))
          .value;
  Computed<String> _$shippingPriceComputed;

  @override
  String get shippingPrice =>
      (_$shippingPriceComputed ??= Computed<String>(() => super.shippingPrice,
              name: '_CheckoutController.shippingPrice'))
          .value;

  final _$inputAtom = Atom(name: '_CheckoutController.input');

  @override
  int get input {
    _$inputAtom.reportRead();
    return super.input;
  }

  @override
  set input(int value) {
    _$inputAtom.reportWrite(value, super.input, () {
      super.input = value;
    });
  }

  final _$priceAtom = Atom(name: '_CheckoutController.price');

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  final _$_CheckoutControllerActionController =
      ActionController(name: '_CheckoutController');

  @override
  void add() {
    final _$actionInfo = _$_CheckoutControllerActionController.startAction(
        name: '_CheckoutController.add');
    try {
      return super.add();
    } finally {
      _$_CheckoutControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void remove() {
    final _$actionInfo = _$_CheckoutControllerActionController.startAction(
        name: '_CheckoutController.remove');
    try {
      return super.remove();
    } finally {
      _$_CheckoutControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(double value) {
    final _$actionInfo = _$_CheckoutControllerActionController.startAction(
        name: '_CheckoutController.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_CheckoutControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  void reset() {
    final _$actionInfo = _$_CheckoutControllerActionController.startAction(
        name: '_CheckoutController.reset');
    try {
      return super.reset();
    } finally {
      _$_CheckoutControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
input: ${input},
price: ${price},
freeShipping: ${freeShipping},
shippingPrice: ${shippingPrice}
    ''';
  }
}
