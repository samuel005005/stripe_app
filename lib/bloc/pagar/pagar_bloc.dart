import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_credit_card/credit_card_form.dart';
import 'package:meta/meta.dart';
import 'package:stripe_app/models/credit_card_custom.dart';

part 'pagar_event.dart';
part 'pagar_state.dart';

class PagarBloc extends Bloc<PagarEvent, PagarState> {
  PagarBloc() : super(PagarState());

  @override
  Stream<PagarState> mapEventToState(
    PagarEvent event,
  ) async* {
    if (event is OnSelectCard) {
      yield state.copyWith(activedCard: true, creditCard: event.creditCard);
    } else if (event is OnDesabledCard) {
      yield state.copyWith(activedCard: false);
    }
  }
}
