import 'package:mobx/mobx.dart';

part 'checkout_controller.g.dart';

class CheckoutController = _CheckoutController with _$CheckoutController;

abstract class _CheckoutController with Store {
  // Observers
  @observable
  int input = 1;

  // Action
  @action
  void add() {
    if (input <= 100) {
      input += 1;
    }
    if (input == 101) {
      input = 0;
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
  void reset() => input = 1;

  //Computed

}
