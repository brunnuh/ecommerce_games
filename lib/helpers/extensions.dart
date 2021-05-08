import 'package:intl/intl.dart';

extension RealExtension on double {
  String toReal() {
    var realFormat = NumberFormat("###.00", "pt_BR");
    return "R\$ " + realFormat.format(this);
  }
}

extension ScoreExtension on int {
  double scoreStar() {
    /// imaginando que 400 seja a pontuacao maxima, dividimos todos por 80, teremos um valor entre 0 - 5
    return this / 80;
  }
}
