import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_credit_card/credit_card_widget.dart';
import 'package:stripe_app/bloc/pagar/pagar_bloc.dart';
import 'package:stripe_app/widgets/total_pay_button.dart';

class CardPage extends StatelessWidget {
  final tarjeta;

  const CardPage({Key key, this.tarjeta}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onBackPressed(context),
      child: Scaffold(
          appBar: AppBar(
            title: Text('Pagar'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () async {
                await _onBackPressed(context);
              },
            ),
          ),
          body: Stack(
            children: [
              Container(),
              Hero(
                tag: tarjeta.cardNumber,
                child: CreditCardWidget(
                  cardNumber: tarjeta.cardNumberHidden,
                  expiryDate: tarjeta.expiracyDate,
                  cardHolderName: tarjeta.cardHolderName,
                  cvvCode: tarjeta.cvv,
                  showBackView: false,
                ),
              ),
              Positioned(bottom: 0, child: TotalPayButton())
            ],
          )),
    );
  }

  Future<bool> _onBackPressed(context) async {
    BlocProvider.of<PagarBloc>(context).add(OnDesabledCard());
    Navigator.of(context).pop();
    return true;
  }
}
