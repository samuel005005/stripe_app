part of 'pagar_bloc.dart';

@immutable
class PagarState {
  final double montoPagar;
  final String moneda;
  final bool activedCard;
  final CreditCardCustom creditCard;

  PagarState({
    this.montoPagar = 375.55,
    this.moneda = 'USD',
    this.activedCard = false,
    this.creditCard,
  });
  PagarState copyWith(
          {double montoPagar,
          String moneda,
          bool activedCard,
          CreditCardCustom creditCard}) =>
      PagarState(
        montoPagar: montoPagar ?? this.montoPagar,
        moneda: moneda ?? this.moneda,
        activedCard: activedCard ?? this.activedCard,
        creditCard: creditCard ?? this.creditCard,
      );
}
