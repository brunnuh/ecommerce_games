// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CheckoutController on _CheckoutController, Store {
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
input: ${input}
    ''';
  }
}
