part of 'pagar_bloc.dart';

@immutable
abstract class PagarEvent {}

class OnSelectCard extends PagarEvent {
  final CreditCardCustom creditCard;

  OnSelectCard(this.creditCard);
}

class OnDesabledCard extends PagarEvent {}
