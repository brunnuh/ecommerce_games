import 'package:ecommerce_games/helpers/extensions.dart';
import 'package:mobx/mobx.dart';

part 'checkout_controller.g.dart';

class CheckoutController = _CheckoutController with _$CheckoutController;

abstract class _CheckoutController with Store {
  // Observers
  @observable
  int input = 1;

  @observable
  double price = 0;

  // Action
  @action
  void add() {
    if (input <= 100) {
      input += 1;
    }
    if (input == 101) {
      input = 1;
    }
  }

  @action
  void remove() {
    if (input > 0) {
      input -= 1;
    }
    if (input == 0) {
      input = 100;
    }
  }

  @action
  void setPrice(double value) => price = value;

  @action
  void reset() {
    input = 1;
    price = 0;
  }

  //Computed
  @computed
  String get freeShipping =>
      input * price > 250 ? "Frete Gratis" : (input * 10.0).toReal();
  String get shippingPrice => input * price > 250
      ? (input * price).toReal()
      : (input * (price + 10)).toReal();
}
